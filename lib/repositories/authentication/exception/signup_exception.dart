class AuthException {
  final String message;

  const AuthException([this.message = "Error Occurred!, Please Try Again!"]);

  factory AuthException.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const AuthException('Invalid Email Address!');

      case 'weak-password':
        return const AuthException('Password is too weak!');

      case 'email-already-in-use':
        return const AuthException('Email is already in use!');

      case 'too-many-requests':
        return const AuthException(
            'Too many requests, Please Try Again Later!');

      case 'invalid-credential':
        return const AuthException(
            'Wrong Password! Try Again with Correct Password!');

      case 'channel-error':
        return const AuthException(
            'Oops, Please Insert Email & Password Correctly!');

      case 'network-request-failed':
        return const AuthException('Please Check Your Network and Try Again!');

      default:
        return const AuthException();
    }
  }
}
