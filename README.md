# Reproduction of sanic-ext OpenAPI Parameter kwargs issue

When using sanic-ext OpenAPI `Parameter` classes to define API parameters, fields that are not listed in the `Parameter` type directly are not passed through to the resulting openapi.json.

# Usage

1. Build dev image with `make image/dev`
2. Enter dev image with `make bash` and run all commands needed therein
3. Within the shell, run `poetry install` to install all depencencies
4. Within the shell, run `poetry run pytype FILE` to type-check FILE
   - You can also run `poetry run pytype -v 2 FILE` to increase the verbosity of the type-checking run

> :warning: Tested on a Linux setup. The Makefile relies on some *nix utils such as `id` (used for assuming the host user identity to simplify file ownership management), `shell` (used for shell expansion) and `realpath` (to extract the absolute paths on the host-side for volume mounting). Anticipating that this may work on BSD-likes and WSL but I don't have the means to test this.

# Cases


# Related Issues

- https://discord.com/channels/812221182594121728/812221182594121731/1089874204767293480
