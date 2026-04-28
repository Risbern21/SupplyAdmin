"""
Gemini 2.5 Flash integration for intelligent supply chain disruption analysis.

Uses the Google GenAI SDK to analyze shipment context and produce
structured risk assessments with actionable suggestions.
"""

import json
import logging
import os

from google import genai
from google.genai import types

logger = logging.getLogger(__name__)

# ── Gemini client (lazy-initialized) ─────────────────────────────────────────

_client = None


def _get_client():
    """Return a cached GenAI client, creating one on first call."""
    global _client
    if _client is None:
        api_key = os.environ.get("GOOGLE_API_KEY")
        if api_key:
            _client = genai.Client(api_key=api_key)
        else:
            # Fall back to Application Default Credentials (ADC)
            _client = genai.Client()
        logger.info("Gemini client initialized")
    return _client


MODEL_ID = os.environ.get("GEMINI_MODEL_ID", "gemini-2.5-flash")

SYSTEM_INSTRUCTION = (
    "You are a supply chain risk analyst AI. "
    "Given shipment details and current conditions, produce a JSON object with exactly these keys:\n"
    '  "summary": a 1-2 sentence overview of the situation,\n'
    '  "risk_level": one of LOW, MEDIUM, HIGH, CRITICAL,\n'
    '  "suggested_actions": a JSON array of 2-5 short actionable strings,\n'
    '  "detailed_analysis": a 3-5 sentence deeper analysis.\n'
    "Respond ONLY with the JSON object, no markdown fences or extra text."
)


def analyze_disruption(
    shipment_id: str,
    origin: str,
    destination: str,
    cargo_type: str,
    current_conditions: str,
) -> dict:
    """
    Call Gemini 2.5 Flash to analyze a potential supply chain disruption.

    Returns a dict with keys: summary, risk_level, suggested_actions, detailed_analysis.
    """
    prompt = (
        f"Shipment ID: {shipment_id}\n"
        f"Origin: {origin}\n"
        f"Destination: {destination}\n"
        f"Cargo Type: {cargo_type}\n"
        f"Current Conditions: {current_conditions}\n\n"
        "Analyze the disruption risk for this shipment and respond with the JSON."
    )

    try:
        client = _get_client()

        response = client.models.generate_content(
            model=MODEL_ID,
            contents=prompt,
            config=types.GenerateContentConfig(
                system_instruction=SYSTEM_INSTRUCTION,
                temperature=0.3,
                max_output_tokens=1024,
            ),
        )

        text = response.text.strip()

        # Strip markdown fences if Gemini wraps anyway
        if text.startswith("```"):
            text = text.split("\n", 1)[1]
        if text.endswith("```"):
            text = text.rsplit("```", 1)[0].strip()

        result = json.loads(text)

        # Normalise keys
        return {
            "summary": result.get("summary", ""),
            "risk_level": result.get("risk_level", "MEDIUM"),
            "suggested_actions": result.get("suggested_actions", []),
            "detailed_analysis": result.get("detailed_analysis", ""),
        }

    except json.JSONDecodeError as exc:
        logger.error("Gemini returned non-JSON: %s", exc)
        return {
            "summary": "Unable to parse Gemini response.",
            "risk_level": "MEDIUM",
            "suggested_actions": ["Retry the analysis", "Check conditions manually"],
            "detailed_analysis": f"Raw response could not be parsed: {exc}",
        }
    except Exception as exc:
        logger.error("Gemini API call failed: %s", exc)
        return {
            "summary": "Gemini analysis unavailable.",
            "risk_level": "MEDIUM",
            "suggested_actions": ["Verify API key / credentials", "Retry later"],
            "detailed_analysis": str(exc),
        }
