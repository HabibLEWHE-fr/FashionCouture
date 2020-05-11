import 'package:fashiontailor/InscriptionPage_2.dart';
import 'package:fashiontailor/InscriptionVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Inscription_1 extends StatefulWidget{
  //
  Inscription_1():super();
  //
  static String tag = 'inscription_1-page';

  @override
  _Inscription_1State createState() => _Inscription_1State();
}

class _Inscription_1State extends State<Inscription_1>{
  //
  final formkey = GlobalKey<FormState>();

  //
  int selectedRadio;

  String _value = null ;
  List<String> _values = List<String>();

  String _value1 = null ;
  List<String> _values1 = List<String>();

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    //
    _values.addAll(["Homme","Femme","Mixte"]);
    _value = _values.elementAt(0);

    _values1.addAll(["Styliste","Brodeur","Traditionnel"]);
    _value1 = _values1.elementAt(0);
  }

  void _onChanged(String value){
    setState(() {
      _value = value;
    });
  }
  void _onChanged1(String value){
    setState(() {
      _value1 = value;
    });
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  void _submit(){
    if(formkey.currentState.validate()){
        Navigator.of(context).pushNamed(Inscription_2.tag);
    }
  }

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

    //fin Appbar

    final gender = ButtonBar(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Sexe : ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'Roboto Medium'
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.white,
                  onChanged: (val){
                    //print('Client $val selected');
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  'M',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto Medium',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.white,
                  onChanged: (val){
                    //print('Client $val selected');
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  'F',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto Medium',
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );

    final typeCouturier = DropdownButton(
      value: _value,
      items: _values.map((String value){
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: <Widget>[
              Text(value,
              )
            ],
          ),
        );
      }).toList(),
      onChanged: (String value){_onChanged(value);},
    );

    final specialiteCouturier = DropdownButton(
      value: _value1,
      items: _values1.map((String value){
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: <Widget>[
              Text(value)
            ],
          ),
        );
      }).toList(),
      onChanged: (String value){_onChanged1(value);},
    );

    final nextButton = Container(
        width: 129.0,
        height: 35.0,
        child:
        RaisedButton(
          onPressed: (){
            _submit();
          },
          color: Colors.indigoAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child:
          Text(
            'Suivant',
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Roboto Medium',
            ),
          ),
        )
    );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: appbar ,
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
                color: Color(0x0095FF).withOpacity(0.35),
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
                        child:
                        Form(
                          key: formkey,
                            child:
                            Padding(
                              padding: EdgeInsets.only(left: 24.0,right: 24.0,top: 40.0),
                              child:
                              Column(
                                children: <Widget>[
                                  lastNameInput,
                                  SizedBox(height: 20.0,),
                                  firstNameInput,
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: <Widget>[
                                      gender
                                    ],
                                  ),
                                  telephoneInput,
                                  SizedBox(height: 30.0,),
                                  Row(
                                    children: <Widget>[
                                      Text('Type de couturier(ère) :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto Medium',
                                            fontSize: 18
                                        ),
                                      ),
                                      SizedBox(width: 20.0,),
                                      Container(
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        child:
                                        typeCouturier,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 35.0,),
                                  Row(
                                    children: <Widget>[
                                      Text('Votre Spécialité :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto Medium',
                                            fontSize: 18
                                        ),
                                      ),
                                      SizedBox(width: 20.0,),
                                      Container(
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        child:
                                        specialiteCouturier,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 70.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      nextButton
                                    ],
                                  )
                                ],
                              ),
                            )
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

