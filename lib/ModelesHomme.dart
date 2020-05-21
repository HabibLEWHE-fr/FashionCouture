import 'package:fashiontailor/Parametres.dart';
import 'package:fashiontailor/detailsPhotos.dart';
import 'package:flutter/material.dart';

class AlbumCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
          alignment: Alignment.center,
          child:
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image(
              image: AssetImage('assets/image2.jpg'),
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}


class Constants {
  static const String Parametres = 'Paramètres';
  static const String Quitter = 'Quitter';

  static const List<String> choices = <String>[
    Parametres,
    Quitter
  ];
}

List<AlbumCell> album = [
  new AlbumCell(),new AlbumCell(),new AlbumCell(),
  new AlbumCell(),new AlbumCell(),new AlbumCell(),
  new AlbumCell(),new AlbumCell(),new AlbumCell(),
  new AlbumCell(),new AlbumCell(),new AlbumCell()
];



class AlbumGidView extends StatefulWidget {

 static String albumGridTag = 'albumGridTag';

  @override
  _AlbumGidViewState createState() => _AlbumGidViewState();
}

class _AlbumGidViewState extends State<AlbumGidView> {

  goToDetailsPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => DetailsPhotos()
    )
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
    final appbar1 = AppBar(
      title: Text("Modeles"),
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
        ),
      ],
    );

    //FinAppbar


    return Scaffold(
      appBar: appbar1,
      body: Container(
        padding: EdgeInsets.all(5.0),
        height: MediaQuery.of(context).size.height-100,
        child:
        GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children:
            List.generate(album.length, (index){
              return GestureDetector(
                child:
                GridTile(
                  child:  album[index],
                ),
                onTap: (){
                  goToDetailsPage(context);
                },
              );
            })
        ),
      )
    );
  }
}


