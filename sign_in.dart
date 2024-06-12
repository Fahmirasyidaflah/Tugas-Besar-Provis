import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '[SIGN UP]',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('[SIGN UP]'),
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
  String _email = '';
  String _password_email = '';
  String _nomorTeleponWA = '';

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
              'Mari Daftar',
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
                  return 'Nama diusahakan tidak kosong ya';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                _email = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Maaf, Email harus diisi';
                }
                return null;
              },
            ),
             TextFormField(
              decoration: InputDecoration(labelText: 'Password Email'),
              onSaved: (value) {
                _password_email = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password Email diusahakan tidak kosong ya';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nomor Telepon WA (Whatsapp)'),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                _nomorTeleponWA = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nomor telepon WA (Whatsapp) diusahakan tidak kosong ya';
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
                          'Nama: $_nama\nEmail: $_email]nPassword Email: $_password_email\nNomor Telepon WA: $_nomorTeleponWA',
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