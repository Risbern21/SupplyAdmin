from ml.api.predict import predict_risk
from ml.api.route_optimizer import optimize_route

sample_input = {
    "weather_severity": 0.9,
    "traffic_density": 0.8,
    "route_congestion": 0.7,
    "distance_remaining": 200,
    "time_of_day": 18,
    "day_of_week": 3,
    "vehicle_speed": 35
}

risk = predict_risk(sample_input)

print(f"Predicted Risk: {risk:.2f}")

if risk > 0.7:
    print(" High risk! Suggest rerouting.")
else:
    print("Route is safe.")


routes = [
    {"route_id": "A", "distance": 120, "traffic": 0.8, "weather": 0.7},
    {"route_id": "B", "distance": 140, "traffic": 0.4, "weather": 0.3},
    {"route_id": "C", "distance": 160, "traffic": 0.3, "weather": 0.2}
]

best, all_routes = optimize_route(routes)

print("\nAll Routes:")
for r in all_routes:
    print(r)

print("\nBest Route Selected:")
print(best)