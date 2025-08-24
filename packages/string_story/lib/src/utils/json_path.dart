T jsonPath<T>(Object object, String jsonPath) {
  final segments = jsonPath.split(".");
  dynamic it = object;
  for (final segment in segments) {
    it = it[segment];
  }
  return it as T;
}
