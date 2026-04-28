from ml.api.predict import predict_risk

def optimize_route(routes):
    results = []

    for route in routes:
        input_data = {
            "weather_severity": route["weather"],
            "traffic_density": route["traffic"],
            "route_congestion": route["traffic"],
            "distance_remaining": route["distance"],
            "time_of_day": 18,
            "day_of_week": 2,
            "vehicle_speed": 50
        }

        risk = predict_risk(input_data)

        route["risk_score"] = risk
        results.append(route)

    # Sort by lowest risk
    best_route = sorted(results, key=lambda x: x["risk_score"])[0]

    return best_route, results