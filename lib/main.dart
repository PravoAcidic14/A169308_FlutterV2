import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'catalogue.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyCatalog(),
      ),
    );

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  int item = 0;
  Catalogue catalogue = new Catalogue();
  List<Catalogue> catalogueItems = [
    Catalogue(
      itemName: "BagPack",
      itemPrice: "12.00",
      itemImage: "image_backpack.png",
      itemDesc: "This is Backpack",
    ),
    Catalogue(
      itemName: "T-Shirt",
      itemPrice: "10.00",
      itemImage: "image_tshirt.png",
      itemDesc: "This is T-Shirt",
    ),
    Catalogue(
      itemName: "Cap",
      itemPrice: "30.00",
      itemImage: "image_cap.png",
      itemDesc: "This is Cap",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        actions: [
          Badge(
            badgeContent: Text('$item'),
            position: BadgePosition.topEnd(top: 2.0, end: 5.0),
            child: IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                setState(() {
                  item = 0;
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: (catalogueItems
            .map((catalogueItem) => createItemCard(catalogueItem))
            .toList()),
      ),
    );
  }

  Widget createItemCard(catalogueItem) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/' + catalogueItem.itemImage),
                    width: 100,
                    height: 100,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      catalogueItem.itemName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(catalogueItem.itemDesc),
                    Text(
                      'RM ' + catalogueItem.itemPrice,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                          fontFamily: 'Courgette'),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          setState(() {
                            item++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        color: Colors.blue,
                        label: Text(
                          'Add Item',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
