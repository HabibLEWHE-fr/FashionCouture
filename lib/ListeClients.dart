import 'package:fashiontailor/CreationClient.dart';
import 'package:fashiontailor/DonneesClients.dart';
import 'package:fashiontailor/ModifierClient.dart';
import 'package:fashiontailor/Parametres.dart';
import 'package:fashiontailor/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListeClients extends StatefulWidget {
  ListeClients() : super();

  @override
  _ListeClientsState createState() => _ListeClientsState();
}

class Constants {
  static const String Parametres = 'Paramètres';
  static const String Quitter = 'Quitter';

  static const List<String> choices = <String>[
    Parametres,
    Quitter
  ];
}

class DesignListe {
  //
  String nomClient = '';
  String avatarCLient = '';
  String numTelClient = '';

  DesignListe({this.nomClient, this.avatarCLient, this.numTelClient});
}

class _ListeClientsState extends State<ListeClients> {
  List<DesignListe> listeDesClients;

  @override
  void initState() {
    super.initState();
    listeDesClients = List();
    addClients();
  }

  addClients() {
    listeDesClients.add(DesignListe(
        nomClient: 'Robes pagnes',
        avatarCLient: 'image1.jpg',
        numTelClient: '61951451'));
    listeDesClients.add(DesignListe(
        nomClient: 'Danchiki',
        avatarCLient: 'image4.jpg',
        numTelClient: '66552341'));
    listeDesClients.add(DesignListe(
        nomClient: 'Boubou',
        avatarCLient: 'image2.jpg',
        numTelClient: '96752431'));
    listeDesClients.add(DesignListe(
        nomClient: 'Tenues locales',
        avatarCLient: 'image3.jpg',
        numTelClient: '98672267'));
    listeDesClients.add(DesignListe(
        nomClient: 'Tenues africaines',
        avatarCLient: 'image2.jpg',
        numTelClient: '65241451'));
    listeDesClients.add(DesignListe(
        nomClient: 'Bazin',
        avatarCLient: 'image1.jpg',
        numTelClient: '65241451'));
  }
  

  Future<void> _nouvelleCommandeDialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(30.0),
            title: Text('Opération sur le client'),
            titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.note_add,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          'Nouvelle commande',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    onTap: () {
                    Navigator.of(context).pushNamed(ModifierClient.tagModifierClient);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _supprimerClient(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Voulez-vous supprimer le client ?',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Annuler',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              VerticalDivider(
                color: Colors.black45,
                width: 1.0,
              ),
              FlatButton(
                child: Text(
                  'Supprimer',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15.0
                  ),
                ),
                onPressed: null,
              )
            ],
          );
        });
  }

  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Widget listeclient() {
    return RefreshIndicator(
      onRefresh: getRefresh,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listeDesClients.length,
        itemBuilder: (context, index) {
          DesignListe item = listeDesClients[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Slidable(
              key: ValueKey(item),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  icon: Icons.note_add,
                  caption: 'Commander',
                  color: Colors.blueAccent,
                  onTap: () => _nouvelleCommandeDialog(),
                ),
                IconSlideAction(
                  icon: Icons.delete,
                  caption: 'Supprimer',
                  color: Colors.redAccent,
                  onTap: () => _supprimerClient(context),
                )
              ],
              child: Card(
                elevation: 1.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: ListTile(
                  onTap: () => Navigator.of(context)
                      .pushNamed(DetailsClients.tagDetailClient),
                  title: Text(item.nomClient),
                  subtitle: Text(item.numTelClient),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${item.avatarCLient}'),
                    radius: 25,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void ChoiceAction(String choice) {
      if(choice == 'Paramètres'){
        Navigator.push(context, MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => Parametres()
        )
        );
      }
      else if(choice == 'Quitter'){
        Navigator.of(context).pop();
      }
    }

    //Appbar
    final appbarListClient = AppBar(
      title: Text('Clients'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null),
        PopupMenuButton<String>(
          onSelected: ChoiceAction,
          itemBuilder: (BuildContext context) {
            return Constants.choices.map((String choices) {
              return PopupMenuItem<String>(
                value: choices,
                child: Text(choices),
              );
            }).toList();
          },
        ),
      ],
    );
    //Fin Appbar

    return Scaffold(
      appBar: appbarListClient,
      body: listeclient(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, right: 10.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(CreerClient.tagCreerClient);
          },
        ),
      ),
    );
  }
}
