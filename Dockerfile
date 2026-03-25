FROM python:3.11-slim

WORKDIR /app

# Copies requirements.txt - docker will cache this if unchanged
COPY requirements.txt .

# Installs the app requirements - again cached if unchanged
RUN pip install -r requirements.txt

# Copies everything else (also technically re-copies requirements.txt)
COPY . .

# Avoid CLI buffering issues
ENV PYTHONUNBUFFERED=1

# Runs 'python main.py sample.txt' 
CMD ["python", "app/main.py", "samples/sample.txt"]