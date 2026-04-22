FROM python:3.11-slim

# Avoid CLI buffering issues
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y curl libfontconfig1 && \
    curl -L https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic%400.15.0/tectonic-0.15.0-x86_64-unknown-linux-musl.tar.gz | tar xz -C /usr/local/bin

# Copies requirements.txt - docker will cache this if unchanged
COPY requirements.txt .

# Installs the app requirements - again cached if unchanged
RUN pip install -r requirements.txt

# Copies everything else (also technically re-copies requirements.txt)
COPY . .

# Runs 'python main.py sample.txt' 
CMD ["python", "main.py", "samples/sample.txt"]