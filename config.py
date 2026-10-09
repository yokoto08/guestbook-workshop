from pydantic import PostgresDsn
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    database_url: PostgresDsn
    greeting: str = "Добро пожаловать в гостевую книгу!"

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")


settings = Settings()
