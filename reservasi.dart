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

  String _nou = '';
  String _koru = '';
  String _jadwal = '';
  String _dokter = '';
   String _janjitemu = '';

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
              decoration: InputDecoration(labelText: 'Nomor Urut'),
              onSaved: (value) {
                _nou = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nomor Urut wajib diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kode Ruangan'),
              onSaved: (value) {
                _koru = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kode Ruangan wajib diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Jadwal'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _jadwal = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Jadwal wajib diisi';
                }
                return null;
              },
            ),
             TextFormField(
              decoration: InputDecoration(labelText: 'Dokter'),
              onSaved: (value) {
                _dokter = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Dokter harus diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Janji Temu'),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                _janjitemu = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Janji Temu Harus diisi';
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
                          'Nomor Urut: $_nou\nKode Ruang: $_koru\nJadwal: $_jadwal\nDokter: $_dokter\nJanji Temu: $_janjitemu\n',
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('Lanjut'), 
            ),
          ],
        ),
      ),
    );
  }
}