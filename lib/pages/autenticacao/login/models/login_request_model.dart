
class LoginRequest {
  String email;
  String senha;

  LoginRequest(this.email, this.senha);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginRequest &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          senha == other.senha;

  @override
  int get hashCode => email.hashCode ^ senha.hashCode;
}