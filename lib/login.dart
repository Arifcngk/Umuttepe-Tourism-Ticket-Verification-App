import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:umuttepe_turizm/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginUser() async {
    if (name.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        String uri =
            "http://10.0.2.2:8080/flutter_api/login.php"; // Giriş kontrolü için PHP dosyasının yolunu belirtin
        var response = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "password": password.text,
        });

        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          // Eğer giriş başarılıysa ana sayfaya yönlendirin
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Eğer giriş başarısızsa hata mesajı gösterin
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Yanlış kullanıcı adı veya şifre")),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kullanıcı adı ve şifre alanları boş olamaz")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.jpg",
                width: 160,
                height: 160,
              ),
              SizedBox(height: 20),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Arka plan rengi beyaz
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Butonun kenarlarını hafifçe yuvarla
                  ),
                ),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black // Yazıyı kalın yap
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
