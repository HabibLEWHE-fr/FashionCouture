import 'package:fashiontailor/AccueilPage.dart';
import 'package:fashiontailor/InscriptionVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Inscription_2 extends StatefulWidget{
  //
  Inscription_2():super();
  //
  static String tag = 'inscription_2-page';

  @override
  _Inscription_2State createState() => _Inscription_2State();
}


class Constants{
  static const String MonCompte = 'Mon compte';
  static const String Parametres = 'Paramètres';
  static const String Partager = 'Partager';
  static const String Apropos = 'A propos';
  static const String Quitter = 'Quitter';

  static const List<String> choices = <String> [
    MonCompte,Parametres, Partager, Apropos, Quitter
  ];
}


void ChoiceAction(String choice){
  //print ('Working');
  if(choice == 'Mon compte'){
    print('je veux manger');
  }
}

class _Inscription_2State extends State<Inscription_2>{
  //

  @override
  Widget build(BuildContext context){

    //Appar
    final appbar = AppBar(
      title: Text('E-Couture'),
      actions: <Widget>[
        PopupMenuButton <String>(
          onSelected: ChoiceAction,
          itemBuilder: (BuildContext context){
            return Constants.choices.map((String choices){
              return PopupMenuItem<String>(
                value: choices,
                child: Text(choices),
              );
            }).toList();
          },
        )
      ],
    );

    //Fin Appbar

    final nextButton = Container(
        width: 129.0,
        height: 35.0,
        child:
        RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed(Accueil.tag);
          },
          color: Colors.indigoAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child:
          Text(
            "S'inscrire",
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Roboto Medium',
            ),
          ),
        )
    );

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: appbar,
        body:
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: bodyContainerDecorationImage,
            child:
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0x0095FF).withOpacity(0.3),
              ),
            child:
              ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child:
                        Stack(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/Rectangle 7.png'),
                              color: Colors.blue,
                            ),
                            Positioned(
                              bottom: 25.0,
                              left: 25.0,
                              child:
                              Text(
                                'Inscription',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Roboto Medium',
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal:24.0),
                        child:
                        Text(
                            "Pour finaliser votre inscription nous avons besoin "
                                "de connaître l'emplacement de votre atelier \n\n"
                                "Êtes-vous sur votre lieu de travail ? ",
                            style: TextStyle(
                              fontFamily: 'Roboto Medium',
                              fontSize: 25.0,
                              color: Colors.tealAccent
                            )
                        ),
                      ),
                      SizedBox(height: 250,),
                      Padding(
                        padding: EdgeInsets.only(right:24.0),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            nextButton
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}