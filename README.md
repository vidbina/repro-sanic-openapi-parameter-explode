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

The returned openapi.json does not list `explode` in the serialized output of a Parameter.

Given the following parameter:

```python
Parameter(
    "tags",
    description="Tags to filter by",
    location="query",
    required=True,
    schema=Schema.make(list[str]),
    explode=True
)
```

The resulting JSON OpenAPI output is lacking the `explode` field:

```json
{
  "openapi": "3.0.3",
  "info": {
    "title": "API",
    "version": "1.0.0",
    "contact": {}
  },
  "paths": {
    "/pet/findByTags": {
      "get": {
        "operationId": "get~get",
        "summary": "Get",
        "parameters": [
          {
            "name": "tags",
            "schema": {
              "type": "array",
              "items": {
                "type": "string"
              }
            },
            "description": "Tags to filter by",
            "required": true,
            "in": "query"
          }
        ],
        "responses": {
          "default": {
            "description": "OK"
          }
        }
      }
    }
  },
  "tags": [],
  "servers": [],
  "security": []
}

```

While the example in https://github.com/sanic-org/sanic-ext/blob/0b2d2af6ee57a73941a1b5e44712cb7b76f6a6aa/tests/extensions/openapi/static/petstore.json#L179 lists the explode field as valid OpenAPI (in this particular case).

# Related Issues

- https://discord.com/channels/812221182594121728/812221182594121731/1089874204767293480
