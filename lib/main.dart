import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'My Item',
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                  fontSize: 30.0,
                ),
              ),
              Text(
                '$item',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                  fontSize: 40.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    setState(() {
                      item = 0;
                    });
                  },
                  icon: Icon(
                    Icons.restore,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Restore Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            item++;
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
