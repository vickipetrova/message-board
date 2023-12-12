FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install flask

RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate"

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENV FLASK_APP app.py

# Database
# RUN mkdir -p /data
# RUN chmod 777 /data
# RUN flask init-db

CMD ["python3", "app.py"]