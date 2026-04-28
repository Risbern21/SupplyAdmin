FROM python:3.12-slim

WORKDIR /app

# Install dependencies first for better Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the full ML service
COPY . .

# Generate proto stubs inside the container
RUN python -m grpc_tools.protoc \
    -I proto \
    --python_out=gen \
    --grpc_python_out=gen \
    proto/ml_service.proto

# Train the model so the saved artifact is baked in
RUN python -m ml.models.train_model

EXPOSE 50051

CMD ["python", "-m", "ml.main"]
