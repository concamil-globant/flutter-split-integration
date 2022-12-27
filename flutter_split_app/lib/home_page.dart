import 'package:flutter/material.dart';

import 'package:splitio/splitio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // split var
  late Splitio _split;
  late SplitClient _client;
  String? configsValue = 'Value:';
  String estado = '';

  @override
  void initState() {
    _split = Splitio('', 'KEY');
    _client = _split.client();
    super.initState();
  }

  @override
  void dispose() {
    _client.destroy();
    super.dispose();
  }

  Future<void> retrieveSplitValue() async {
    // seteamos el pais el formato es {"atribute_name", "value"}
    // con esto obtenemos el valor unicamente para nuestro pais seleccionado
    await _client.setAttribute("country", "hn");

    final String treatment = await _client.getTreatment('Paquetigos_FF_Categories');

    /// la función getTreatmentWithConfig se usa para obtener los valores de las configuraciones dinámicas
    /// en forma de JSON, se pueden configurar valores cuando está en off y on
    /// en caso que no se asigne valores a la variable, entonces devuelve null
    SplitResult result = await _client.getTreatmentWithConfig("Paquetigos_FF_Categories");

    /// _split.splitNames() trae el listado de todos los splits
    /// ejemplo: [Paquetigos_FF_Categories, GV_Wallet_Version]
    List<String> getSplits = await _split.splitNames();

    // Tratamiento de Variables Grandes, primero se obtiene el index
    SplitResult stackIndex = await _client.getTreatmentWithConfig('GV_signup_Dynamic_Form_data_index');
    var valores = stackIndex.config;

    setState(() {
      configsValue = result.config;
      estado = treatment;
    });

    if (treatment == 'hn') {
      // flujo cuando el pais es HN
    } else if (treatment == 'mx') {
      // // flujo cuando el pais es MX
    } else {
      // flujo cuando el pais no existe (NO APLICA)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // get split name
            TextButton(
              onPressed: () {
                retrieveSplitValue();
              },
              child: Container(
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text(
                  'Get split Console',
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('State: ' + estado),
            const SizedBox(
              height: 20,
            ),
            Text(configsValue ?? 'no data'),
          ],
        ),
      ),
    );
  }
}
