import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGN UP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
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

  String _kode_yang_diberikan = '';
  String _elemen_awal = '';
  String _elemen_akhir = '';

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
              'Kode OTP',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kode yang diberikan'),
              onSaved: (value) {
                _kode_yang_diberikan = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kode harus diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Elemen Pertama Kode OTP'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _elemen_awal = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'bagian ini harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
             TextFormField(
              decoration: InputDecoration(labelText: 'Elemen Terakhir Kode OTP'),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                _elemen_akhir = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'bagian ini harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          'Kode yang diberikan: $_kode_yang_diberikan\nElemen Pertama Kode OTP: $_elemen_awal\nElemen Terakhir Kode OTP: $_elemen_akhir\n',
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('Selesai'), 
            ),
          ],
        ),
      ),
    );
  }
}
