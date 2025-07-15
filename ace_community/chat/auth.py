import requests
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from django.conf import settings

from laravel_models.models import users  

class LaravelTokenAuth(BaseAuthentication):
    def authenticate(self, request):
        token = request.headers.get('Authorization')
        if not token:
            return None

        try:
            response = requests.post(
                'https://ace-community.hyglaxit.com/api/auth/decrypt-token',
                headers={'Authorization': token}
            )
            if response.status_code != 200:
                raise AuthenticationFailed("Invalid token")

            data = response.json()
            user_data = data.get("user_data")
            if not user_data:
                raise AuthenticationFailed("User data not found in token")

            user_id = user_data.get("id")
            if not user_id:
                raise AuthenticationFailed("User ID missing in token")

            try:
                user = users.objects.get(id=user_id)
                setattr(user, 'is_authenticated', True)
                return (user, None)
            except users.DoesNotExist:
                raise AuthenticationFailed("User not found in database")

        except requests.RequestException:
            raise AuthenticationFailed("Failed to verify token with Laravel API")
