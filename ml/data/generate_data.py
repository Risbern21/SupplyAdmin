import numpy as np
import pandas as pd


def generate_data(n=3000):
    np.random.seed(42)
    data = []

    for _ in range(n):
        weather = np.random.uniform(0, 1)
        traffic = np.random.uniform(0, 1)
        congestion = np.random.uniform(0, 1)
        distance = np.random.uniform(10, 500)
        time = np.random.randint(0, 24)
        day = np.random.randint(0, 7)
        speed = np.random.uniform(20, 100)

        risk_score = (
            0.35 * weather
            + 0.30 * traffic
            + 0.20 * congestion
            + 0.10 * (distance / 500)
            + 0.05 * (1 if time in [8, 9, 17, 18] else 0)
        )

        risk_score += np.random.normal(0, 0.05)

        delay = 1 if risk_score > 0.5 else 0

        data.append([weather, traffic, congestion, distance, time, day, speed, delay])

    df = pd.DataFrame(
        data,
        columns=[
            "weather_severity",
            "traffic_density",
            "route_congestion",
            "distance_remaining",
            "time_of_day",
            "day_of_week",
            "vehicle_speed",
            "delay",
        ],
    )

    return df

