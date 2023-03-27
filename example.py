from sanic import Sanic, json
from sanic_ext import validate, openapi

from sanic_ext.extensions.openapi.definitions import Parameter
from sanic_ext.extensions.openapi.types import Schema

api = Sanic("test")


@api.get("/pet/findByTags")
@openapi.definition(
    # https://github.com/sanic-org/sanic-ext/blob/0b2d2af6ee57a73941a1b5e44712cb7b76f6a6aa/tests/extensions/openapi/static/petstore.json#L179
    parameter=Parameter(
        "tags",
        description="Tags to filter by",
        location="query",
        required=True,
        schema=Schema.make(list[str]),
        explode=True
    ),
)
async def get(request):
    return json({})
