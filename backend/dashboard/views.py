import json
from pathlib import Path
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response


@api_view(["GET"])
@permission_classes([AllowAny])
def demo_dashboard(request):
    fixture = Path(__file__).with_name("demo_dashboard.json")
    return Response(json.loads(fixture.read_text(encoding="utf-8")))
