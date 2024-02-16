class Header {
  // SECURE HEADER
  static Map<String, dynamic> secureHeader = {
    "Authorization": "Bearer 'token'",
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // DEFAULT HEADER
  static Map<String, dynamic> defaultHeader = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
}
