class MyDeleteException implements Exception {
  String message;
  MyDeleteException(this.message);

  @override
  String toString() {
    return this.message;
  }
}
