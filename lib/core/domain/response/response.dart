abstract class Response {
  String? get code;
  String get message;
}

class UnExpectedFailure implements Response {
  @override
  final String? code;

  @override
  final String message;

  UnExpectedFailure({
    required this.message,
    this.code,
  });
}
