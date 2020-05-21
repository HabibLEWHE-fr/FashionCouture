import 'package:fashiontailor/InscriptionPage_1.dart';
import 'package:fashiontailor/Parametres.dart';
import 'package:fashiontailor/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Connexion extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //Appbar
    final appbar = AppBar(
      title: Text('E-Couture',
        style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w500,
            fontSize: 25.0
        ),
      ),
    );

    //Fin Appbar

    final text = Text(
      'CONNEXION',
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500
      ),
    );

    final emailInput = TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Nom d'utilisateur",
          labelStyle: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Roboto Medium',
              color: Colors.white
          ),
        prefixIcon: Icon(Icons.email,color: Colors.white70,),
        alignLabelWithHint: true,
        hintText: 'Votre adresse',
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        enabledBorder:  OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )
      ),
    );

    final passwordInput = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Mot de Passe',
          labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Roboto Medium',
            color: Colors.white
          ),
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.lock,color: Colors.white70,),
          suffixIcon: IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.visibility_off),
          ),
          hintText: 'Votre Mot de Passe',
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        enabledBorder:  OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      ),
      validator: (input) => input.length < 8 ? 'Minimum 8 caractères': null,
    );


    final inputButton = Container(
        width: 200.0,
        height: 50.0,
      child:
        RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed(Inscription_1.tag);
          },
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          child:
          Text(
            'Se connecter',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Roboto Medium',
            ),
          ),
        )
    );

    final forgotPassText = FlatButton(
      child:
      Text(
        'Mot de passe oublié ?',
        style: TextStyle(
          color: Colors.white,
            fontSize: 13.0,
            wordSpacing: 2.0,
            fontWeight: FontWeight.bold
        )

      ),
      onPressed: (){},

    );

    final createAccount = FlatButton(
      child:
      Text(
          'Créer un compte',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          )
      ),
      onPressed: (){},
    );

    return Scaffold(
        appBar: appbar,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image1.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x0095FF).withOpacity(0.3),
            ),
            child:
                Container(
                  height: MediaQuery.of(context).size.height,
                  child:
                  Center(
                    child:
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(left: 24.0,right: 24.0),
                      children: <Widget>[
                        text,
                        SizedBox(height: 60.0),
                        emailInput,
                        SizedBox(height: 15.0),
                        passwordInput,
                        SizedBox(height: 30.0),
                        inputButton,
                        SizedBox(height: 15.0),
                        forgotPassText,
                        SizedBox(height: 20.0),
                        createAccount,
                      ],
                    ),
                  )
                )
          ),
        )
    );
  }
}

