import 'package:coincoins_insolites_mobile/api/users/authenticate_user.dart';
import 'package:coincoins_insolites_mobile/controller/main_app_controller.dart';
import 'package:coincoins_insolites_mobile/api/users/create_user.dart';
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coincoins_insolites_mobile/library/material_home.dart';

//Page de Login / Create

class LoginController extends StatefulWidget {

  _LoginState createState() => _LoginState();
}

TextEditingController mail;
TextEditingController password = new TextEditingController();
TextEditingController pseudo;

class _LoginState extends State<LoginController> {

  PageController _pageController;
  

  bool _obscureTextLogin = true;

  bool checkCGU = false; 

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    mail = TextEditingController();
    password = TextEditingController();
    pseudo = TextEditingController();
  }

  @override
  void dispose() {
    mail.dispose();
    password.dispose();
    pseudo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
            onTap: () {
              hideKeyboard();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              //Si on a une taille d'écran plus grand que 700.0 on prend toute la hauteur sinon on aura un petit scroll
              height: (MediaQuery.of(context).size.height >= 400.0)
                  ? MediaQuery.of(context).size.height
                  : 650.0,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    //Logo + titre
                    PaddingWith(
                      widget: Image(
                        image: logoDuck,
                        height: 75.0,
                      ),
                      top: 100.0,
                    ),
                    //Menu Login ou Create
                    PaddingWith(
                      widget: Menu2Items(
                        item1: AppLocalizations.of(context).translate('CreateText'),
                        item2: AppLocalizations.of(context).translate('LoginText'),
                        pageController: _pageController,
                      ),
                    ),
                    //Fenetre champs de connexion ou d'inscription
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        children: <Widget>[
                          logView(1, context),
                          logView(2, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      )
    ;
  }

//Gere la Colonne de connexion ou d'inscription
  Widget logView(int index, BuildContext context) {
    //Fenetre de Connexion ou d'inscription
    return Column(
      children: <Widget>[
        PaddingWith(
          widget: Card(
              elevation: 7.5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: listItems((index == 2)),
                ),
              )),
          top: 15.0,
          bottom: 15.0,
          left: 20.0,
          right: 20.0,
        ),
        //Bouton Connexion ou Inscription
        PaddingWith(
            top: 15.0,
            bottom: 6.0,
            widget: Card(
                elevation: 7.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Container(
                  width: 300.0,
                  height: 50.0,
                  decoration: MyGradient(
                      startColor: Colors.blue,
                      endColor: Colors.blue[300],
                      radius: 25.0,
                      horizontal: true),
                  child: FlatButton(
                      onPressed: () {
                        signIn((index == 2), context);
                      },
                      child: MyText(
                          (index == 2) ? AppLocalizations.of(context).translate('ConnexionText') : AppLocalizations.of(context).translate('CreationText'))),
                ))),
      ],
    );
  }

  //Function for logging in or registering
  signIn(bool exists, BuildContext context) {
    //Test for account creation
    if(!exists){
      
      final bool isValid = EmailValidator.validate(mail.text);

      //Toast message if no nickname is given
      if(pseudo.text == null && pseudo.text == ""){
        return toastAuthenticate(AppLocalizations.of(context).translate('MissingPseudo'));
      }

      //Toast message if no mail is filled in
      if(mail.text == null || mail.text == ""){
        return toastAuthenticate(AppLocalizations.of(context).translate('MissingMail'));
      }

      //Toast message if no password is given
      if(password.text == null || password.text == ""){
        return toastAuthenticate(AppLocalizations.of(context).translate('MissingPassword'));
      }

      //Toast message if the password is less than 8 characters long
      if(password.text.length <= 7){
        return toastAuthenticate(AppLocalizations.of(context).translate('ShortPassword'));
      }

      //Toast message if the email format is not valid
      if(isValid == false){
        return toastAuthenticate(AppLocalizations.of(context).translate('FormatMail'));
      }

      //Create
      return create(context);

      //Test for the connexion with exist account
    }else if(exists){
  
      final bool isValid = EmailValidator.validate(mail.text);

      //Toast message if no mail is filled in
      if(mail.text == null || mail.text == ""){
        return toastAuthenticate(AppLocalizations.of(context).translate('MissingMail'));
      }

      //Toast message if no password is given
      if(password.text == null || password.text == ""){
        return toastAuthenticate(AppLocalizations.of(context).translate('MissingPassword'));
      }

      //Toast message if the password is less than 8 characters long
      if(password.text.length <= 7){
        return toastAuthenticate(AppLocalizations.of(context).translate('ShortPassword'));
      }

      //Toast message if the email format is not valid
      if(isValid == false){
        return toastAuthenticate(AppLocalizations.of(context).translate('FormatMail'));
      }

      //Login
      return login(context);
    }
  }

  //Mehtode for Create New Account User
  create(BuildContext context) {

      CreateUser().createUser(pseudo.text.trim(), mail.text.toLowerCase().trim(), password.text, context);
      hideKeyboard();
      Navigator.push(context, new MaterialPageRoute(builder: (context) => MainAppController()));
      pseudo.clear();
      mail.clear();
      password.clear(); 
    
  }

  //Methode for sign in with account user already create
  login(BuildContext context) {
    AuthenticateUser().authenticateUser(mail.text.toLowerCase().trim(), password.text);
    hideKeyboard();
    Navigator.push(context, new MaterialPageRoute(builder: (context) => MainAppController()));
    mail.clear();
    password.clear(); 
  }

  //Champs Create et Login
  List<Widget> listItems(bool exists) {
    List<Widget> list = [];

    //Si on veut créér un compte le champ pseudo apparait en supplément
    if (!exists) {

      //Champ Pseudo
      list.add(MyTextField(
        controller: pseudo,
        hint: "Pseudo",
        textCapitalization: TextCapitalization.sentences,
        icon: Icon(Icons.account_circle),
      ));
    }

    //Champ Adresse mail
    list.add(MyTextField(
      controller: mail,
      hint: "Adresse mail",
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      type: TextInputType.emailAddress,
      icon: Icon(Icons.mail),
    ));

    //Champ Mot de passe
    list.add(MyTextField(
      controller: password,
      hint: "Mot de passe",
      textCapitalization: TextCapitalization.none,
      obscure: _obscureTextLogin,
      icon: Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: _toggleLogin,
        child: (_obscureTextLogin == true)
            ?Icon(Icons.visibility,)
            :Icon(Icons.visibility_off),
      ),
    )
    );
    return list;
  }

  //Fonction pour fermer le clavier si l'on touche n'importe où sur l'écran
  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //Permet de rendre le mot de passe visible si l'on touche l'icône "oeil"
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}