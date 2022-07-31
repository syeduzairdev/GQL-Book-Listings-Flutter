class AuthTokenRepository {
  AuthTokenDao authTokenDao = AuthTokenDao();

  AuthToken getAuthToken() => authTokenDao.getAuthToken();

  Future<void> updateAuthToken(AuthToken authToken) =>
      authTokenDao.updateAuthToken(authToken);

  bool _authTokenRequest = true;

  setAuthTokenForRequest() {
    _authTokenRequest = false;
  }

  bool authTokenSetForRequest() {
    return _authTokenRequest;
  }
}

class AuthTokenDao {
  AuthTokenDao();
  // final AppDatabase database;

  AuthToken getAuthToken() {
    // final authToken = await database.authTokenDao.getAuthToken();
    final authToken = AuthToken(
      token: 'Bearer: lskdhaslkdsdnlaksjdasdqwq908e213',
    );
    return authToken;
  }

  Future<void> updateAuthToken(AuthToken authToken) async {
    // await database.authTokenDao.updateAuthToken(authToken);
  }
}

class AuthToken {
  AuthToken({required this.token});
  final String token;
}
