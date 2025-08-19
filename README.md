# Hello Flask App

A minimal Flask application that displays a message and runs on port 3000.

## Getting Started

### Requirements

- Python 3.11+ (if running without Docker)
- Docker (for containerized execution)

### Running Locally (without Docker)

1. Install Flask:
    ```bash
    pip install flask
    ```

2. Start the app:
    ```bash
    python app.py
    ```

The app will be available at: [http://localhost:3000](http://localhost:3000)

---

## Running with Docker

Build the Docker image:

```bash
docker build -t helloj-flask .
```

Run the container:

```bash
docker run -p 3000:3000 helloj-flask
```

The app will be available at: [http://localhost:3000](http://localhost:3000)

---

## Project Structure

```
.
├── app.py
├── Dockerfile
└── README.md
```

---

## License

MIT
