from django.core.cache import cache
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
import requests

from laravel_models.models import Users


class LaravelTokenAuth(BaseAuthentication):
    def authenticate(self, request):
        token = request.headers.get('Authorization')
        if not token:
            return None

        cache_key = f"laravel_auth_token:{token}"
        cached_user_id = cache.get(cache_key)

        if cached_user_id:
            try:
                user = Users.objects.get(id=cached_user_id)
                setattr(user, 'is_authenticated', True)
                return (user, None)
            except Users.DoesNotExist:
                cache.delete(cache_key)  # cleanup corrupted cache

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

            user = Users.objects.get(id=user_id)
            setattr(user, 'is_authenticated', True)

            # Cache for 5 minutes
            cache.set(cache_key, user_id, timeout=300)

            return (user, None)

        except requests.RequestException:
            raise AuthenticationFailed("Failed to verify token with Laravel API")
