from pathlib import Path

PROJECT_FOLDER = '{{ cookiecutter.book_slug }}'

PROJECT_PATH = Path(PROJECT_FOLDER).resolve().parent

print(PROJECT_PATH)

ENVIRONMENT_VARS = {
    "PIPENV_VENV_IN_PROJECT": 1
}

env_content = "\n".join(f"{name}={value}" for name, value in ENVIRONMENT_VARS.items())

env_path = PROJECT_PATH / ".env"
env_path.write_text(env_content)
