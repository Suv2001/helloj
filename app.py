from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask! The app is running on port 3000. this is for commit action checking.  it was triggered by GitHub webhooks."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
