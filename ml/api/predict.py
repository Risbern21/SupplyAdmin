import joblib
import numpy as np
import pandas as pd

MODEL_PATH = "ml/saved_models/model.pkl"

model = joblib.load(MODEL_PATH)

def predict_risk(input_data):
    """
    input_data = {
        "weather_severity": 0.8,
        "traffic_density": 0.7,
        "route_congestion": 0.6,
        "distance_remaining": 120,
        "time_of_day": 18,
        "day_of_week": 2,
        "vehicle_speed": 40
    }
    """

    df = pd.DataFrame([input_data])

    prob = model.predict_proba(df)[0][1]

    return prob