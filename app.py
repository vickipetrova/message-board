from KanbanFlaskr import app 
import os

if __name__ == '__main__':
    # app.run(port=8000)
    port = int(os.environ.get("FLASK_RUN_PORT", 8000))
    app.run(host="0.0.0.0", port=port)
