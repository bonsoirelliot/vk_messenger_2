class CustomException implements Exception {
  late final String? title;
  late final String? subtitle;

  CustomException({
    this.title,
    this.subtitle,
  });

  @override
  String toString() => title ?? 'CustomException';
}
