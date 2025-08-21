from django.urls import path
from core.views import (
    AddCourtView,
    ToggleStatusCourtView
)

urlpatterns = [
    # 🔹 Direct Chat (1:1)
    path('club/court/', AddCourtView.as_view(), name='add-court'),
    path('club/court/status-change/', ToggleStatusCourtView.as_view(), name="club-court-status-change"),

]
