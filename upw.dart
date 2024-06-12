import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tubes_provis',
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
        body: UbahPasswordForm(),
      ),
    );
  }
}

class UbahPasswordForm extends StatefulWidget {
  @override
  _UbahPasswordFormState createState() => _UbahPasswordFormState();
}

class _UbahPasswordFormState extends State<UbahPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  String _pwsi = '';
  String _pwb = '';
  String _upwb = '';

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
              'Ubah Password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password Saat ini'),
              onSaved: (value) {
                _pwsi = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return '[Password Saat Ini] diusahakan diisi';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password Baru'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                _pwb = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return '[Password Baru] diusahakan diisi';
                }
                return null;
              },
            ),
             TextFormField(
              decoration: InputDecoration(labelText: 'Ulangi Password Baru'),
              onSaved: (value) {
                _upwb = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'bagian [Ulangi Password Baru] harus diisi';
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
                          'Password Saat Ini: $_pwsi\nPassword Baru: $_pwb\nUlangi Password Baru: $_upwb\n',
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