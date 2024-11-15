class InvalidUsernameException implements Exception {
  final String link;

  InvalidUsernameException(this.link);

  @override
  String toString() {
    return "Manifold user dosen't exist: $link";
  }
}

class UnexpectedResponseException implements Exception {
  final String message;

  UnexpectedResponseException(this.message);

  @override
  String toString() {
    return message;
  }
}

class InternalException implements Exception {
  final String message;

  InternalException(this.message);

  @override
  String toString() {
    return "hmm. internal error: $message";
  }
}
