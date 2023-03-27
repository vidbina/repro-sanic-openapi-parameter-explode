# Reproduction of sanic-ext OpenAPI Parameter kwargs issue

When using sanic-ext OpenAPI `Parameter` classes to define API parameters, fields that are not listed in the `Parameter` type directly are not passed through to the resulting openapi.json.

# Usage

> :warning: Tested on a Linux setup. The Makefile relies on some *nix utils such as `id` (used for assuming the host user identity to simplify file ownership management), `shell` (used for shell expansion) and `realpath` (to extract the absolute paths on the host-side for volume mounting). Anticipating that this may work on BSD-likes and WSL but I don't have the means to test this.

## The easy way

1. Build image with `make image`
2. Run sanic example with `make`

## The hard way

1. Build dev image with `make image/dev`
2. Enter dev image with `make bash` and run all commands needed therein
3. Within the shell, run `poetry shell` to activate the Poetry-managed venv
4. Within the venv shell, run `poetry install` to install all depencencies
5. Within the venv shell, run `poetry run sanic example.api --debug` to run the Sanic app

# Cases


# Related Issues

- https://discord.com/channels/812221182594121728/812221182594121731/1089874204767293480
