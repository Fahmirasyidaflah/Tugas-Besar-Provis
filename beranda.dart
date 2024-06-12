import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BERANDA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo, Prawowo'),
        ),
        body: DataDiriForm(),
      ),
    );
  }
}

class DataDiriForm extends StatefulWidget {
  @override
  _DataDiriFormState createState() => _DataDiriFormState();
}

class _DataDiriFormState extends State<DataDiriForm> {
  final _formKey = GlobalKey<FormState>();

  String _riwayat = '';
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BERANDA',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'RIWAYAT'),
              onSaved: (value) {
                _riwayat = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Penyakit yang diderita';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'STATUS'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _status = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kondisi Pasien';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          'RIWAYAT $_riwayat\nSTATUS $_status\n',
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('Halaman Selanjutnya'), 
            ),
          ],
        ),
      ),
    );
  }
}
