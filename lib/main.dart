import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: tfKullaniciAdi,
                      decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Kullanıcı Adını Giriniz";
                        }
                        return null;
                      }),
                  TextFormField(
                      controller: tfKullaniciAdi,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Şifre"),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Şifre Giriniz";
                        }
                        if (tfgirdisi.length < 6) {
                          return "Şifreniz en az 6 haneli olmalıdır";
                        }
                        return null;
                      }),
                  ElevatedButton(
                    child: Text("Giriş"),
                    onPressed: () {
                      bool kontrolSonucu = formKey.currentState!.validate();
                      if (kontrolSonucu) {
                        String ka = tfKullaniciAdi.text;
                        String s = tfSifre.text;
                        print("Kullanıcı Adı:$ka - Şifre :$s");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
