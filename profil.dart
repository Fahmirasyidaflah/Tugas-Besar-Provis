import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservasi',
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

  String _nama = '';
  String _nik = '';
  String _jenis_kelamin = '';
  String _tanggal_lahir = '';

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
              'Data Pasien Baru',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama'),
              onSaved: (value) {
                _nama = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama wajib diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'NIK'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _nik = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'NIK wajib diisi';
                }
                return null;
              },
            ),
             TextFormField(
              decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              onSaved: (value) {
                _jenis_kelamin = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Jenis Kelamin wajib diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                _tanggal_lahir = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tanggal lahir wajib diisi';
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
                          'Nama: $_nama\nNIK: $_nik\nJenis Kelamin: $_jenis_kelamin\nTanggal Lahir: $_tanggal_lahir\n',
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('SIMPAN'), 
            ),
          ],
        ),
      ),
    );
  }
}