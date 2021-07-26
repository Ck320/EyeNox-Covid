import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListTextStatus.dart';

import 'dados.dart';

class DialogListHistory extends StatelessWidget {
  final cep;

  DialogListHistory(this.cep);

  @override
  Widget build(BuildContext context) {
    DataHistorico data = new DataHistorico();
    data.addHistorico("123456", 9);
    data.addHistorico("14026120", 3);
    data.addHistorico("17033360", 300);

    data.addHistoricoData("17033360", 17, 3);
    data.addHistoricoData("17010130", 43, 3);

    /*final listHistory = ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 30,
          color: const Color(0xff3b184c),
          child: Center(
              child: Text(
            'History ${[index]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );*/

    int aux;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: const Color(0xff202020),
              height: 1000,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: data.buscaPorCep(this.cep).length,
                  itemBuilder: (BuildContext context, int index) {
                    aux = data.buscaPorCep(this.cep)[index];
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: const Color(0xff3b184c)),
                      height: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff202020),
                              radius: 20,
                              child: Icon(
                                Icons.map_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Divider(
                              height: 20,
                            ),
                            TextStatus(cep,aux)
                            /*Text(
                              '${this.cep} \n $aux',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )*/
                          ]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ),
          ],
        ));
  }
}

class PrincipalViewHistory extends StatelessWidget {
  final cep;

  PrincipalViewHistory(this.cep);

  bool aglomera(int quant) {
    if (quant > 20) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    DataHistorico dataL = new DataHistorico();
    dataL.addHistorico("123456", 9);
    dataL.addHistorico("14026120", 3);
    dataL.addHistorico("17033360", 300);

    DataSimples data = dataL.getDados(this.cep);

    if (aglomera(data.quantidadePessoas)) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                color: const Color(0xff202020),
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xff3b184c),
                        radius: 40,
                        child: Icon(
                          Icons.push_pin_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Divider(
                        height: 40,
                      ),
                      Text(
                        'CEP: ${this.cep}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'Data: $now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Divider(height: 30),
                      Text(
                        'Inseguro',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                      Text(
                        'Alto indice de pessoas num raio de 50m',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    } else {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                color: const Color(0xff202020),
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xff3b184c),
                        radius: 40,
                        child: Icon(
                          Icons.push_pin_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Divider(
                        height: 40,
                      ),
                      Text(
                        'CEP: ${this.cep}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'Data: $now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Divider(height: 30),
                      Text(
                        'Seguro',
                        style:
                            TextStyle(fontSize: 20, color: Colors.greenAccent),
                      ),
                      Text(
                        'Baixo ou medio indice de pessoas num raio de 50m',
                        style:
                            TextStyle(fontSize: 20, color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    }
  }
}

/*class AdvanceCustomAlert extends StatelessWidget {
  final title;

  AdvanceCustomAlert(this.title);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A'];

    final listHistory = ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 30,
          color: const Color(0xff3b184c),
          child: Center(
              child: Text(
            'History ${entries[index]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 30,
                      color: const Color(0xff3b184c),
                      child: Center(
                          child: Text(
                        'History ${entries[index]} - $title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )
                /*child: Column(

                  /*
                  children: [
                    Text('Warning !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('You can not access this file', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: Colors.redAccent,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                */)*/
                ,
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 60,
                  child: Icon(
                    Icons.assistant_photo,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}*/

/*class _MyAppState extends StatefulWidget {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
*/
