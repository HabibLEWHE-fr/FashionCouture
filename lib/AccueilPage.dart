import 'package:fashiontailor/Catalogue.dart';
import 'package:fashiontailor/ContenuAccueil.dart';
import 'package:fashiontailor/ListeClients.dart';
import 'package:fashiontailor/ListeCommades.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Accueil extends StatefulWidget{
  static String tag = 'accueil-page';

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil>{

  int _currentIndex = 0;
  //
  Widget Pages(int currentIndex){
    switch(currentIndex){
      case 0: return ContenuAccueil();
      case 1: return ListeClients();
      case 2: return ListeCommandes();
      case 3: return Catalogue();
      break;
      default: ContenuAccueil();
    }
  }

  @override
  Widget build(BuildContext context){

    //Bottom Navigation Bar
    final bottomNavBar = BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value){
        _currentIndex = value;
        setState(() {

        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Accueil',
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Clients',
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Commandes',
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Catalogue',
          ),
          backgroundColor: Colors.blue,
        )
      ],
    );

    //Fin Bottom Navigation Bar


    return Scaffold(
      body: Pages(_currentIndex),
      bottomNavigationBar: bottomNavBar,
    );
  }
}

