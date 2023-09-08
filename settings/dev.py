# ruff: noqa: F405

from .base import *

ALLOWED_HOSTS += ["*"]

CORS_ALLOWED_ORIGINS += [
    "http://127.0.0.1",
    "http://127.0.0.1:4200",
]
