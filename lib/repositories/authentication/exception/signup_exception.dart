class AuthException {
  final String message;

  const AuthException([this.message = "Terjadi Erorr, Silahkan Coba Lagi!"]);

  factory AuthException.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const AuthException('Email Tidak Valid!');
      default:
        print(code);
        return const AuthException();
    }
  }
}
