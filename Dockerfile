# Dockerfile
FROM python:3.14-slim

# Argumentos de construcción
ARG PLATFORMIO_VERSION
ARG PLATFORM_NAME=""

RUN if [ -z "$PLATFORMIO_VERSION" ]; then \
      pip install --no-cache-dir platformio; \
    else \
      pip install --no-cache-dir "platformio==$PLATFORMIO_VERSION"; \
    fi

RUN if [ -n "$PLATFORM_NAME" ]; then \
      pio platform install "$PLATFORM_NAME"; \
    fi

RUN pio --version

WORKDIR /workspace

CMD ["pio", "--help"]
