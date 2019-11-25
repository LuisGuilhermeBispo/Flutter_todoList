import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Horario extends StatefulWidget {

  @override
  _HorarioState createState() => _HorarioState();
}
  
class _HorarioState extends State<Horario> {

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
  }

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final TextEditingController _controller = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = now;
    var maxYear = new DateTime(now.year + 2);
    initialDate = (initialDate.isAfter(now)  && initialDate.isBefore(maxYear) ? initialDate : now);
    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: now,
        lastDate: maxYear
        );

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try 
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Marcar horário'),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    validator: (val) => val.isEmpty ? 'Nome é OBRIGATÓRIO' : null,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Coloque seu nome completo',
                      labelText: 'Nome Completo:',
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(35),
                    ],
                  ),
                  new Row(children: <Widget>[
    new Expanded(
        child: new TextFormField(
      decoration: new InputDecoration(
        icon: const Icon(Icons.calendar_today),
        hintText: 'Coloque a data de consulta',
        labelText: 'Mês/Dia/Ano',
      ),
      controller: _controller,
      keyboardType: TextInputType.datetime,
    )),
    new IconButton(
      icon: new Icon(Icons.more_horiz),
      tooltip: 'Escolha a data',
      onPressed: (() {
        _chooseDate(context, _controller.text);
      }),
    )
  ]),
                  
                  
                  new TextFormField(
                    
                    validator: (value) => isValidPhoneNumber(value) ? null : 'Phone number must be entered as (DDD)####-####',
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Coloque seu número para contato',
                      labelText: 'Número de Telefone:',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      new WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
                      LengthLimitingTextInputFormatter(15),
                    ],
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Digite um e-mail válido',
                      labelText: 'Email:',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Enviar'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
