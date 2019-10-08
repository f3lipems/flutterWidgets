import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/instrument_page.dart';
import 'package:flutter_app01/utils/nav.dart';

class Instruments {
  String nome;
  String foto;

  Instruments(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("Lista");
                setState(() {
                  _gridView = false;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("Grid");
                setState(() {
                  _gridView = true;
                });
              },
            ),
          ],
        ),
        body: _body());
  }

  _body() {
    List<Instruments> instruments = [
      Instruments("MX 61", "assets/images/mx61.jpg"),
      Instruments("JDR 94", "assets/images/jdr94.jpg"),
      Instruments("Motif", "assets/images/motif.webp"),
      Instruments("Odery", "assets/images/odery.jpg"),
      Instruments("Line 6", "assets/images/line6.jpg"),
    ];


    if(_gridView) {
      return GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: instruments.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(instruments, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 300,
        itemCount: instruments.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(instruments, index);
        },
      );
    }
  }

  _itemView(List<Instruments> instruments, int index) {
    Instruments instrument = instruments[index];
    
    return GestureDetector(
      onTap: () {
        push(context, InstrumentPage(instrument));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(instrument.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                instrument.nome,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
