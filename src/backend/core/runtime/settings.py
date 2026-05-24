from typing import ClassVar

from pydantic_settings import BaseSettings, SettingsConfigDict


class AppSettings(BaseSettings):
    model_config: ClassVar[SettingsConfigDict] = SettingsConfigDict(
        env_file='.env',
        env_file_encoding='utf-8',
        extra='ignore'
    )

    DEBUG: bool = True

    SECRET_KEY: str = ''

    DJANGO_SETTINGS_MODULE: str = 'config.settings.local'

    # Database settings
    POSTGRES_DB: str
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_HOST: str = 'localhost'
    POSTGRES_PORT: int = 5432


settings: AppSettings = AppSettings()
