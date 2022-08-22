class Configs {
  // static final String _baseUrl = 'http://10.0.2.2:8000/api/';
  static final String _baseUrl = 'http://128.65.177.216:8000/api/';
  static final String _authUrl = '';
  static final String _contentUrl = '';

  static String getAuthUrl = '$_baseUrl$_authUrl';
  static String getContentUrl = '$_baseUrl$_contentUrl';
}
