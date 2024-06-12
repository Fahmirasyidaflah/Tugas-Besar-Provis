import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STATUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Silahkan ketik ulang untuk konfirmasi'),
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

  String _nomor_antrian = 'sudah nomor 12, tinggal 02 nomor lagi';
  String _ruangperiksa = 'ruang periksa 02';
  String _konsultasif = 'konsultasi sedang berlangsung';
  String _konsultasil = 'konsultasi telah selesai';
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
              'Mari  Cek',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Sudah nomor 12, tinggal 02 nomor lagi'),
              onSaved: (value) {
                _nomor_antrian = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ketik ulang nomor (dari email) untuk konfirmasi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Ruang periksa 02'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _ruangperiksa = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ketik ulang ruang periksa (dari email) untuk konfirmasi';
                }
                return null;
              },
            ),
             TextFormField(
              decoration: InputDecoration(labelText: 'Konsultasi sedang berlangsung'),
              onSaved: (value) {
                _konsultasif = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ketik ulang kondisi konsultasi (jika masih berlansung) untuk konfirmasi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Konsultasi Sudah Selesai'),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                _konsultasil = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ketik ulang kondisi terakhir konsultasi (jika sudah) untuk konfirmasi';
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
                          'Sudah nomor 12, tinggal 02 nomor lagi$_nomor_antrian\nRuang periksa 02  $_ruangperiksa\nKonsultasi sedang berlangsung $_konsultasif\nKonsultasi sudah selesai $_konsultasil\n',
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('Konfirmasi'), //kode OTP akan dikirim setelah Verifikasi
            ),
          ],
        ),
      ),
    );
  }
}
