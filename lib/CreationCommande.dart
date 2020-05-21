import 'dart:io';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';

class CreerCommande extends StatefulWidget {
  static String tagCreerCommande = 'tagCreerCommande';

  CreerCommande() : super();

  @override
  _CreerCommandeState createState() => _CreerCommandeState();
}

class TenueAjouter {
  //
  String avatarTenue = '';

  TenueAjouter({this.avatarTenue});
}

class _CreerCommandeState extends State<CreerCommande> {

  List<TenueAjouter> listeDesTenues;

  String _value1 = null;

  Widget ajoutTenueDialog = null;

  List<String> _values1 = List<String>();

  Widget _ajoutTenueDialog(){}


  @override
  void initState() {
    super.initState();
    _values1.addAll([
      "Manche Courte",
      "Manche Longue",
      "Pantalon",
      "Veste",
      "Tenue locale",
      "Robe",
      "Jupe",
      "Complet"
    ]);
    _value1 = _values1.elementAt(0);

    ajoutTenueDialog = _ajoutTenueDialog();

    listeDesTenues = List();
    addTenues();
  }

  addTenues() {
    listeDesTenues.add(TenueAjouter(
        avatarTenue: 'image1.jpg',
    ));
  }

  Widget listetenues() {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listeDesTenues.length,
      itemBuilder: (context, index) {
        TenueAjouter item = listeDesTenues[index];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Dismissible(
          key: ValueKey(item),
          background: Container(
            child: IconSlideAction(
              icon: Icons.delete,
              caption: 'Supprimer',
              color: Colors.redAccent,
            ),
            color: Colors.red,
          ),
          onDismissed: (direction){
            setState(() {
              listeDesTenues.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Tenue '+'${index} supprimé'),
              action: SnackBarAction(
                label: 'Annulé',
                onPressed: () {
                  setState(() {
                    listeDesTenues.insert(index, item);
                  });
                },
              ),
            ));
          },
            child: Card(
              elevation: 1.0,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: ListTile(
                onTap: () {},
                title: Text('Tenue '+'$index'),
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/${item.avatarTenue}'),
                  radius: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onChanged1(String value) {
    setState(() {
      _value1 = value;
    });
  }

  DateTime _dateTime, _dateTime1;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTime == null ? DateTime.now() : _dateTime,
      firstDate: DateTime(2001),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != _dateTime) {
      setState(() {
        _dateTime = picked;
      });
    }
  }

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTime1 == null ? DateTime.now() : _dateTime1,
      firstDate: DateTime(2001),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != _dateTime1) {
      setState(() {
        _dateTime1 = picked;
      });
    }
  }


  File imageFileCamera, imageFileGallery;

  @override
  Widget build(BuildContext context) {

    Widget _ajoutTenueDialog() {

      final choixTenue = DropdownButton(
        value: _value1,
        items: _values1.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Row(
              children: <Widget>[
                Text(value),
              ],
            ),
          );
        }).toList(),
        onChanged: (String value) {
          _onChanged1(value);
        },
      );

      _prendrePhoto() async {
        var photo = await ImagePicker.pickImage(source: ImageSource.camera);
        this.setState(() {
          imageFileCamera = photo;
        });
      }

      _ouvrirGallery() async {
        var photo = await ImagePicker.pickImage(source: ImageSource.gallery);
        this.setState(() {
          imageFileGallery = photo;
        });
      }

      _decideImageViewPhoto() {
        if (imageFileCamera == null) {
          return Center(
            child: IconButton(
              onPressed: () {
                return _prendrePhoto();
              },
              icon: Icon(Icons.image),
              iconSize: 100.0,
              color: Colors.grey,
            ),
          );
        } else {
          return Center(
              child: Container(
                child: Image.file(
                  imageFileCamera,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ));
        }
      }

      _decideImageViewGallery() {
        if (imageFileGallery == null) {
          return Center(
              child: IconButton(
                onPressed: () {
                  return _ouvrirGallery();
                },
                icon: Icon(Icons.image),
                iconSize: 100.0,
                color: Colors.grey,
              ));
        } else {
          return Center(
              child: Container(
                child: Image.file(
                  imageFileGallery,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ));
        }
      }

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
    }


    //Appbar
    final creerCommandeAppbar = AppBar(
      title: Text('Nouvelle Commande'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: null),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
    //FinAppbar

    return Scaffold(
      appBar: creerCommandeAppbar,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/image4.jpg'),
                          radius: 45,
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Habib LEWHE'),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('61951451'),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Sexe : M'),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Teint : Noir')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          _dateTime == null
                              ? 'Date de commande'
                              : _dateTime.toString(),
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black54),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          child: IconButton(
                            icon: Icon(
                              Icons.date_range,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              _selectDate1(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          _dateTime1 == null ? 'Date de livraison' : _dateTime1.toString(),
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black54),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Montant avancé',
                      hintStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: Colors.black45),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: FlatButton.icon(
                      onPressed: () {
                        return _ajoutTenueDialog();
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.red,
                      ),
                      label: Text(
                        'ajouter une tenue',
                        style:
                            TextStyle(fontSize: 12.0, color: Colors.lightBlue),
                      ),
                    )),
                Divider(
                  color: Colors.lightBlue,
                  height: 0,
                  thickness: 1.0,
                ),
                Container(
                  child: listetenues(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
