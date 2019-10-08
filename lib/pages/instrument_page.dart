import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/hello_list_view.dart';

class InstrumentPage extends StatelessWidget {
  final Instruments inst;

  InstrumentPage(
      this.inst); //  const Instrument({Key key, this.instruments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(inst.nome),
      ),
      body: Image.asset(inst.foto),
    );
  }
}
