import os
import joblib
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

from ml.data.generate_data import generate_data
from ml.utils.preprocess import preprocess

def train():
    df = generate_data()

    X,y = preprocess(df)

    X_train, X_test, y_train,y_test = train_test_split(X, y, test_size = 0.2)

    model = RandomForestClassifier(n_estimators = 100)
    model.fit(X_train,y_train)

    os.makedirs("ml/saved_models", exist_ok=True)
    joblib.dump(model, "ml/saved_models/model.pkl")

    print("Model trained and saved!")

if __name__ == "__main__":
    train()

