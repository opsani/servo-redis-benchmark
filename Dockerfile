FROM python:3.5-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install PyYAML redis requests pandas

# Install servo
ADD https://raw.githubusercontent.com/opsani/servo-redis/master/adjust \
    https://raw.githubusercontent.com/opsani/servo/master/adjust.py \
    https://raw.githubusercontent.com/opsani/servo/master/measure.py \
    https://raw.githubusercontent.com/opsani/servo/master/servo \
    measure \
    /servo/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo
RUN cp config.yaml.example config.yaml

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]
