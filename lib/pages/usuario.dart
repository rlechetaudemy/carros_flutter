
class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario(this.login, this.nome, this.email, this.token, this.roles);

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }


}