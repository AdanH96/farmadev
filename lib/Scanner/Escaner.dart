import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';

//*CLASE DE PRUEBA ((IMPLEMENTAR BUSQUEDA POR CN, ESCRITO POR CAMPO. CASI TODOS LOS MEDICAMENTOS LO TRAEN))
//buscar otra manera de buscar el medicamento. Por via escaner es poco fiable.
//hay que buscar algun tipo de modulo por pyhton que sea atraves de fotos.

class Escaner extends StatefulWidget {
  const Escaner({super.key});

  @override
  State<Escaner> createState() => _EscanerState();
}

class _EscanerState extends State<Escaner> {
  String codigoNacional = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Escaner de código de barras'),
        ),
        body: ListView(children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                ScanResult result = await BarcodeScanner.scan();
                setState(() {
                  codigoNacional = extraerCodigoNacional(result.rawContent);

                  print(codigoNacional);
                });
              },
              child: const Text('Escanear'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
              child: Text(
            'El resultado es: $codigoNacional',
            style: const TextStyle(fontSize: 16),
          ))
        ]));
  }

  String extraerCodigoNacional(String rawContent) {
    // Dividir por separador ASCII 29 si existe
    List<String> parts = rawContent.split(String.fromCharCode(29));

    for (String part in parts) {
      if (part.startsWith('01')) {
        print('PART+ $part');
        // Extraer GTIN completo (14 dígitos después de '01')
        String gtin = part.substring(2, 16);
        print('Gtin+ $gtin');

        if (gtin.length == 14) {
          // Verificar si el primer dígito es un '0' y ajustarlo
          if (gtin.startsWith('0')) {
            return gtin.substring(
                7, 13); // CN = Dígitos 7 a 12 (sin el primer 0)
          } else {
            return gtin.substring(6, 12); // CN = Dígitos 7 a 12
          }
        }
      }
    }

    return 'CN no encontrado';
  }
}
