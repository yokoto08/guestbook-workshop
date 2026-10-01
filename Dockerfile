# Dockerfile
FROM python:3.12-slim

# Устанавливаем uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Сначала копируем только файлы зависимостей
COPY pyproject.toml uv.lock ./

# Устанавливаем зависимости без самого проекта (оптимизация кэша)
RUN uv sync --frozen --no-install-project --no-dev

# Копируем исходный код
COPY . .

# Запускаем приложение на 0.0.0.0, чтобы оно было доступно извне контейнера
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]