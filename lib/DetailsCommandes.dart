import 'package:flutter/material.dart';

class DetailsCommandes extends StatefulWidget {
  static String tagDetailsCommandes = 'tagDetailsCommandes';

  @override
  _DetailsCommandesState createState() => _DetailsCommandesState();
}

class _DetailsCommandesState extends State<DetailsCommandes> {


  @override
  Widget build(BuildContext context) {

    final appbarDetailsCommande = AppBar(
      title: Text('Info commande'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.mode_edit,
            color: Colors.white,
          ),
          onPressed: (){},
        ),
        IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: null
        ),
      ],
      leading:
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

    return Scaffold(
      appBar: appbarDetailsCommande,
      body: Column(
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
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}
