class DataResponse<T> {
  final List<T> data;

  DataResponse({required this.data});

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    List<T> Function(dynamic) fromJsonT,
  ) {
    return DataResponse<T>(data: fromJsonT(json['data']));
  }
}
