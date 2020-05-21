import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCommandes extends StatefulWidget {
  static String tagDetailsCommandes = 'tagDetailsCommandes';

  @override
  _DetailsCommandesState createState() => _DetailsCommandesState();
}

class _DetailsCommandesState extends State<DetailsCommandes> {


  @override
  Widget build(BuildContext context) {

    /*void _ajoutTenueDialog(BuildContext context) {

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Ajouter une nouvelle tenue',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Prendre une photo du tissu ...',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.lightBlue),
                            ),
                            Divider(
                              color: Colors.lightBlue,
                              thickness: 1.0,
                            ),
                            _decideImageViewPhoto(),
                            Text(
                              'Choisir un modèle',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.lightBlue),
                            ),
                            Divider(
                              color: Colors.lightBlue,
                              thickness: 1.0,
                            ),
                            _decideImageViewGallery(),
                            choixTenue,
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: false, decimal: false),
                                onSaved: (value) {},
                                decoration: InputDecoration(
                                  hintText: 'Prix',
                                  hintStyle: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.black45),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (value) {},
                                decoration: InputDecoration(
                                  hintText: 'Observations du client',
                                  hintStyle: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.black45),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'ANNULER',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ),
                                //SizedBox(width: 8.0,),
                                FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    'ENREGISTRER',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          });
    }*/


    final appbarDetailsCommande = AppBar(
      title: Text('Info commande'),
    );

    return Scaffold(
      appBar: appbarDetailsCommande,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image4.jpg'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('LEWHE Habib',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10.0,),
                        Text('M, Noir',style: TextStyle(fontSize: 18.0),),
                        SizedBox(height: 10.0,),
                        Text('61951451',style: TextStyle(fontSize: 18.0),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 15.0),
                child:
                Text(
                  'Details de la commande',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontFamily: 'Roboto Medium',
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(color: Colors.lightBlue,height: 0.0,),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                          'Date de la commande'
                      ),
                      subtitle: Text(
                          '2020-05-12'
                      ),
                      trailing: Icon(Icons.mode_edit),
                    ),
                    ListTile(
                      title: Text(
                          'Date de livraison'
                      ),
                      subtitle: Text(
                          '2020-05-15'
                      ),
                      trailing: Icon(Icons.mode_edit),
                    ),
                    ListTile(
                      title: Text(
                          'Montant avancé'
                      ),
                      subtitle: Text(
                          '5.000 fr'
                      ),
                      trailing: Icon(Icons.mode_edit),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                      ),
                      child: FlatButton(
                          child: Text(
                            'Tenue(s) commandé(s)',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        onPressed: (){
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
