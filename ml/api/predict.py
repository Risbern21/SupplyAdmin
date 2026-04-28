import os

import joblib
import numpy as np
import pandas as pd

MODEL_PATH = os.environ.get("MODEL_PATH", "ml/saved_models/model.pkl")

# Lazy-loaded model — avoids crash when model file doesn't exist yet
_model = None


def _get_model():
    """Load the trained model on first call and cache it."""
    global _model
    if _model is None:
        _model = joblib.load(MODEL_PATH)
    return _model


def predict_risk(input_data):
    """
    Predict disruption risk probability using the trained RandomForest model.

    input_data = {
        "weather_severity": 0.8,
        "traffic_density": 0.7,
        "route_congestion": 0.6,
        "distance_remaining": 120,
        "time_of_day": 18,
        "day_of_week": 2,
        "vehicle_speed": 40
    }

    Returns a float in [0.0, 1.0].
    """
    model = _get_model()
    df = pd.DataFrame([input_data])
    prob = model.predict_proba(df)[0][1]
    return prob