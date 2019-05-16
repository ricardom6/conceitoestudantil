import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController notaAController = TextEditingController();
  TextEditingController notaBController = TextEditingController();
  TextEditingController notaCController = TextEditingController();
  TextEditingController conceitoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    //celsiusController.text = "";
    //fahrenheitController.text = "";
  }

  void _converter() {
    double notaA = double.parse(notaAController.text);
    double notaB = double.parse(notaBController.text);
    double notaC = double.parse(notaCController.text);
    double Result = (notaA + notaB + notaC) /3;
    String stConceito = "";
    if (Result >=9) stConceito = "Conceito A";
    else if (Result >=7.5) stConceito = "Conceito B";
    else if (Result >=6) stConceito = "Conceito C";
    else if (Result >=4) stConceito = "Conceito D";
    else stConceito = "Conceito A";
    conceitoController.text = stConceito;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleDecoration = TextStyle(color: Colors.blue, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.lightBlueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _converter();
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Text("Verificar"),
      color: Colors.blueAccent,
    );

    AppBar appBar = AppBar(
      title: Text("Verificação de Resultados"),
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: <Widget>[

      ],
    );

    Image imgLogo = Image.asset(
      "images/logo.png",
      height: 120,
      width: 120,
    );
    /*Icon icon = Icon(
      Icons.wb_sunny,
      size: 120,
      color: Colors.yellow,
    );*/

    TextFormField tFNotaA = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Nota A:',
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
        //suffixText: "ºC",
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaAController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe um valor";
        }
      },
    );
    TextFormField tFNotaB = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Nota B:',
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
        //suffixText: "ºC",
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaBController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe um valor";
        }
      },
    );
    TextFormField tFNotaC = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Nota C:',
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
        //suffixText: "ºC",
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaCController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe um valor";
        }
      },
    );
    TextFormField tFConceito = TextFormField(
      enabled: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Conceito',
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
        //suffixText: "ºF",
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: conceitoController,
      /*validator: (value){
        if (value.isEmpty){
          return "Informe um valor";
        }
      },*/
    );

    Container containerBtn = Container(
      padding: EdgeInsets.fromLTRB(8, 24, 8, 24),
      height: 100.0,
      child: raisedButton,
    );

    //ListView column = ListView(
    //  padding: EdgeInsets.all(10),
    //  shrinkWrap: true,
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //icon,
        Divider(),
        tFNotaA,
        Divider(),
        tFNotaB,
        Divider(),
        tFNotaC,
        Divider(),
        tFConceito,
        containerBtn,
      ],
    );

    Form form = Form(
      child: column,
      key: _formKey,
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
    //Container containerColuna =
    //  Container(padding: EdgeInsets.all(8), child: column);

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );
    return scaffold;
  }
}
