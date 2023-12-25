
class ApiResponse<T> {
  late bool ok = false;
  late String title;
  late String msg;
  late int code;
  late T result;
  late T? result2;
  late T? codeEnum;

  ApiResponse.ok(this.result, {this.title = "", this.result2, this.msg = "", this.code = 0, this.codeEnum }) {
    ok = true;
  }

  ApiResponse.error(this.result, { this.title = "", this.msg = "", this.code = 0, this.codeEnum}) {
    ok = false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiResponse &&
          runtimeType == other.runtimeType &&
          ok == other.ok &&
          result == other.result;

  @override
  int get hashCode => ok.hashCode ^ result.hashCode;
}