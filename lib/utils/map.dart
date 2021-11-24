extension MapsExt on Map<String, dynamic> {
  Map<String, T> transformValues<T>(
      T Function(String key, dynamic data) transform) {
    return map((key, value) => MapEntry(key, transform(key, value)));
  }
}
