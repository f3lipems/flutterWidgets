import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/hello_list_view.dart';
import 'package:flutter_app01/pages/hello_page2.dart';
import 'package:flutter_app01/pages/hello_page3.dart';
import 'package:flutter_app01/utils/nav.dart';
import 'package:flutter_app01/widgets/blue_button.dart';
import 'package:flutter_app01/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Tab 1",),
            Tab(text: "Tab 2",),
          ],),
        ),
        body: TabBarView(children: <Widget>[
          _body(context),
          Container(
            color: Colors.green,
          ),
        ],),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DoawerList(),
      ),
    );
  }

  void _onClickFab() {
    print("Add");
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _text(),
              _pageView(),
              _buttons(),
            ],
          )),
    );
  }

  Container _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: PageView(
        children: <Widget>[
          _img("assets/images/mx61.jpg"),
          _img("assets/images/motif.webp"),
          _img("assets/images/jdr94.jpg"),
          _img("assets/images/odery.jpg"),
          _img("assets/images/line6.jpg"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('ListView',
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton('Page 2',
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton('Page 3',
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('Snack', onPressed: () => _onClickSnack(context)),
                BlueButton('Dialog', onPressed: () => _onClickDialog(context)),
                BlueButton('Toast', onPressed: _onClickToast),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack(BuildContext contex) {
    Scaffold.of(contex).showSnackBar(
      SnackBar(
        content: Text("Ola Flutter"),
        action: SnackBarAction(
          textColor: Colors.green,
          label: "Ok",
          onPressed: () {
            print("Ok!");
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é massa!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                  print("Ok!!!");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito tri!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _button(String label, Function onPressed) {
    return BlueButton(label, onPressed: onPressed);
  }

  _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "App de exemplos Flutter",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.amber,
      ),
    );
  }
}
