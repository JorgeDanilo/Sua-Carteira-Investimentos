import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/bloc/user_bloc.dart';
import 'package:sua_carteira_investimentos/helpers/navigator.dart';
import 'package:sua_carteira_investimentos/model/user.dart';
import 'package:sua_carteira_investimentos/pages/dashboard_page.dart';

enum AuthMode {LOGIN, SINGUP}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenHeight;
  AuthMode _authMode = AuthMode.LOGIN;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailLoginController  = TextEditingController();
  final passwordLoginController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            lowerHalf(context),
            upperHalf(context),
            _authMode == AuthMode.LOGIN ? loginCard(context) : singUp(context),
            pageTitle(),
          ],
        ),
      ),
    );
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/images/logo_home.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }

  Widget loginCard(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: screenHeight / 4),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Email é obrigatório";
                        }
                        return null;
                      },
                      controller: emailLoginController,
                      decoration: InputDecoration(
                        labelText: "Seu Email",
                        hasFloatingPlaceholder: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordLoginController,
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Senha é obrigatório";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Sua Senha",
                        hasFloatingPlaceholder: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {},
                          child: Text("Esqueceu sua senha ?"),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                          child: Text("Login"),
                          color: Color(0xFF4B9DFE),
                          textColor: Colors.white,
                          padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            login();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40,),
              Text(
                "Você ainda não tem conta ?",
                style: TextStyle(color: Colors.grey),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _authMode = AuthMode.SINGUP;
                  });
                },
                textColor: Colors.black87,
                child: Text("Criar Conta"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          TODO: here icon app
          Text(
            "Sua Carteira de Investimentos",
            style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget singUp(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:  screenHeight / 5),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty) {
                          return 'Nome é obrigatório';
                        }
                         return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Seu Nome",
                        hasFloatingPlaceholder: true,
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty) {
                          return 'Email é obrigatório';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Seu Email",
                        hasFloatingPlaceholder: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Senha é obrigatória";
                        }
                        if (value.length < 8) {
                          return "Por favor, informe uma senha maior que 8 dígitos";
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Sua Senha",
                        hasFloatingPlaceholder: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "A senha deverá contar pelo menos 8 caratectes",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                          child: Text("Cadastrar"),
                          color: Color(0xFF4B9DFE),
                          textColor: Colors.white,
                          padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(5),
                          ),
                          onPressed: () {
                            saveUser();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40,),
              Text("Você já tem Conta?",
              style: TextStyle(color: Colors.grey),),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _authMode = AuthMode.LOGIN;
                  });
                },
                textColor: Colors.black87,
                child: Text("Login"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text(
                "Termos & Condições",
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void saveUser() {
    if(_formKey.currentState.validate()) {
      User user = User();
      user.name = this.nameController.text;
      user.email = this.emailController.text;
      user.password = this.passwordController.text;
      var userSaved = UserBloc().save(user);
      print("User : ${userSaved}");
      push(context, DashboardPage(), replace: true);
    }
  }

  void login() {
    if (_loginFormKey.currentState.validate()) {
      push(context, DashboardPage(), replace: true);
    }
  }
}

