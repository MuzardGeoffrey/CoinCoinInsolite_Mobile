
import 'package:coincoins_insolites_mobile/api/users/update_user.dart';
import 'package:coincoins_insolites_mobile/controller/login_controller.dart';
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:coincoins_insolites_mobile/library/material_home.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<ProfilPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureTextLogin = true;

  @override
  void initState() {
    super.initState();
    pseudo = TextEditingController();
    mail = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText("Profil", fontSize: 20.0,),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () => hideKeyboard(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //Field text pseudo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Pseudo"),
                      MyText(
                        pseudo.text,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.create),
                        onPressed: () {
                          changeUserPseudonym(
                            context, 
                            pseudonym: pseudo,
                          );
                        },
                      )
                    ],
                  ),
                  //Field text mail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Mail"),
                      MyText(
                        mail.text,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.create),
                        onPressed: () {
                          changeUserMail(
                            context, 
                            mail: mail, 
                          );
                        },
                      )
                    ],
                  ),
                  //Field text password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Password",),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: password,
                          obscureText: _obscureTextLogin,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                            onTap: _toggleLogin,
                            child: (_obscureTextLogin == true)
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            ),
                          ),
                          onEditingComplete: (){
                            //Toast message if the password is less than 8 characters long
                            if(password.text.length <= 7){
                              return toastAuthenticate(AppLocalizations.of(context).translate('ShortPassword'));
                            }

                            //Toast message if no password is given
                            if(password.text == null || password.text == ""){
                              return toastAuthenticate(AppLocalizations.of(context).translate('MissingPassword'));
                            }

                            UpdateUser().updateUser({
                              "password": password.text
                            });
                            hideKeyboard();
                          },
                        ),
                      ),
                     /* IconButton(
                        icon: Icon(Icons.create),
                        onPressed: () {
                          changePassword(context, password: password);
                        },
                      )*/
                    ],
                  ),
                ],
              ),
            )),
      ),
      //Deconnexion Button
      floatingActionButton: FlatButton(
        child: MyText(
          AppLocalizations.of(context).translate('LogOutText'), 
          color: Colors.black,
          ),
        onPressed: (){
          Navigator.of(context).pop(LoginController());
        },  
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> changeUserMail(BuildContext context, {@required TextEditingController mail}) async {
    MyTextField mailTF = MyTextField(
      controller: mail,
      hint: AppLocalizations.of(context).translate('MailText'),
      autofocus: true,
      textCapitalization: TextCapitalization.none,
    );
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context).translate('ChangeMailTitle'),
              style: TextStyle(color: Colors.orange, fontSize: 20.0),
            ),
            content: Container(
              height: 50.0,
              child: Column(
                children: <Widget>[mailTF],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            actions: <Widget>[
              //Button Cancel
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('CancelText'),
                  style: TextStyle(color: orangeSalmon),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              //Button OK
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.indigo),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<void> changeUserPseudonym(BuildContext context, {@required TextEditingController pseudonym}) async {
    MyTextField pseudonymTF = MyTextField(
      controller: pseudonym,
      hint: AppLocalizations.of(context).translate('PseudoText'),
      autofocus: true,
      textCapitalization: TextCapitalization.none,
    );
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context).translate('ChangePseudoTitle'),
              style: TextStyle(color: Colors.orange, fontSize: 20.0),
            ),
            content: Container(
              height: 50.0,
              child: Column(
                children: <Widget>[pseudonymTF],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            actions: <Widget>[
              //Button Cancel
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('CancelText'),
                  style: TextStyle(color: orangeSalmon),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              //Button OK
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.indigo),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //Permet de rendre le mot de passe visible si l'on touche l'icône "oeil"
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

   //Fonction pour fermer le clavier si l'on touche n'importe où sur l'écran
  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
