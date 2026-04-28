def preprocess(df):
    X = df.drop("delay", axis=1)
    y = df["delay"]
    return X, y