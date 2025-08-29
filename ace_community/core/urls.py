from django.urls import path
from core.views import (
    AddCourtView,
    ToggleStatusCourtView,
    AddSlotView
)

urlpatterns = [
    # 🔹 Direct Chat (1:1)
    path('club/court/', AddCourtView.as_view(), name='add-court'),
    path('club/court/status-change/', ToggleStatusCourtView.as_view(), name="club-court-status-change"),
    path('club/court/price-list/time-slot/', AddSlotView.as_view(), name="add-time-slot-price-list"),

]
