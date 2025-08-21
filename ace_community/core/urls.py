from django.urls import path
from core.views import (
    AddCourtView
)

urlpatterns = [
    # 🔹 Direct Chat (1:1)
    path('club/court/', AddCourtView.as_view(), name='add-court'),

]
