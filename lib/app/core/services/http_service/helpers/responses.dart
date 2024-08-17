class GetHttpServiceResponse<T> {
  final T? data;
  final int? status;

  const GetHttpServiceResponse({
    required this.data,
    this.status,
  });
}