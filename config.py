# config.py
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    database_url: str

    # Pydantic автоматически подтянет значения из файла .env
    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8")


settings = Settings()