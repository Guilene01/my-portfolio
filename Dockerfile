FROM python:3.9-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt  # <-- fails if deps conflict

EXPOSE 5001
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

CMD ["flask", "run"]
