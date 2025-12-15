FROM python:3.11

ARG PLATFORMIO_VERSION

RUN if [ -z "$PLATFORMIO_VERSION" ]; then \
      pip install --no-cache-dir platformio; \
    else \
      pip install --no-cache-dir "platformio==$PLATFORMIO_VERSION"; \
    fi

# Verificar la versión instalada
RUN pio --version
