
class ApiResponse<T> {
  bool ok;
  String msg;
  T result;

  ApiResponse.ok({this.result,this.msg}) {
    ok = true;
  }

  ApiResponse.error({this.result,this.msg}) {
    ok = false;
  }
}