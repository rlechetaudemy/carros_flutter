import 'package:carros/firebase/firebase_service.dart';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/cadastro/cadastro_page.dart';
import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/pages/login/login_bloc.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:carros/firebase.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _bloc = LoginBloc();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();

    initFcm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: (s) => _validateLogin(s),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(height: 10),
            AppText(
              "Senha",
              "Digite a senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return AppButton(
                  "Login",
                  onPressed: _onClickLogin,
                  showProgress: snapshot.data,
                );
              },
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: GoogleSignInButton(
                onPressed: _onClickGoogle,
              ),
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: _onClickCadastrar,
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onClickGoogle() async {
    final service = FirebaseService();
    ApiResponse response = await service.loginGoogle();

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    ApiResponse response = await _bloc.login(login, senha);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 números";
    }
    return null;
  }

  void _onClickCadastrar() async {
    push(context, CadastroPage(),replace:true);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
