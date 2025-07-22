from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from chat.models import CustomToken
from laravel_models.models import Users

# Patch Users to behave like Django user
Users.is_authenticated = property(lambda self: True)

class CustomTokenAuthentication(BaseAuthentication):
    def authenticate(self, request):
        auth_header = request.headers.get('Authorization')
        if not auth_header or not auth_header.startswith('Token '):
            return None

        token_key = auth_header.split('Token ')[1]
        try:
            token = CustomToken.objects.get(key=token_key)
        except CustomToken.DoesNotExist:
            raise AuthenticationFailed('Invalid token.')

        return (token.user, token)
