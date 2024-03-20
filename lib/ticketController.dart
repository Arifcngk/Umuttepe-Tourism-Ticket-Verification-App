import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:http/http.dart' as http;

class MyTicketView extends StatefulWidget {
  final String pnrNumber;

  const MyTicketView({Key? key, required this.pnrNumber}) : super(key: key);

  @override
  State<MyTicketView> createState() => _MyTicketViewState();
}

class _MyTicketViewState extends State<MyTicketView> {
  TextEditingController idController = TextEditingController();
  String pnrCode = "";
  String nereden = "";
  String nereye = "";
  String adi = "";
  String soyadi = "";
  String tarih = "";
  String koltuk = "";
  String plaka = "";
  String saat = "";

  @override
  void initState() {
    super.initState();
    // Sayfa yüklenirken getUserInfo fonksiyonunu çağırarak verileri çek
    getUserInfo(int.parse(widget.pnrNumber));
  }

  Future<void> getUserInfo(int id) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8080/flutter_api/pnr.php"), // API endpointi
      body: {'id': id.toString()}, // Kullanıcı ID'si
    );

    if (response.statusCode == 200) {
      // HTTP isteği başarılı ise verileri al
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        pnrCode = data['pnr_code'];
        nereden = data['nereden'];
        nereye = data['nereye'];
        adi = data['adi'];
        soyadi = data['soyadi'];
        tarih = data['tarih'];
        koltuk = data['koltuk'];
        plaka = data['plaka'];
        saat = data['saat'];
      });
    } else {
      // HTTP isteği başarısız ise hata mesajı göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Kullanıcı bilgileri alınamadı.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TicketWidget(
            width: 320, // Widget'ın genişliği
            height: 450, // Widget'ın yüksekliği
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            child: TicketData(
              pnrNumber: widget.pnrNumber,
              pnrCode: pnrCode,
              nereden: nereden,
              nereye: nereye,
              adi: adi,
              soyadi: soyadi,
              tarih: tarih,
              koltuk: koltuk,
              plaka: plaka,
              saat: saat,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}

class TicketData extends StatelessWidget {
  final String pnrNumber;
  final String pnrCode;
  final String nereden;
  final String nereye;
  final String adi;
  final String soyadi;
  final String tarih;
  final String koltuk;
  final String plaka;
  final String saat;

  const TicketData({
    Key? key,
    required this.pnrNumber,
    required this.pnrCode,
    required this.nereden,
    required this.nereye,
    required this.adi,
    required this.soyadi,
    required this.tarih,
    required this.koltuk,
    required this.plaka,
    required this.saat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Sefer Bilgilerim',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  nereden,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.pink,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    nereye,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 45.0, left: 40),
              child: ticketDetailsWidget(
                  'Adı-Soyadı:', '$adi $soyadi', 'Tarih:', tarih),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 45.0, left: 40),
              child: ticketDetailsWidget(
                  'Araç Plakası:', plaka, 'Koltuk No:', koltuk),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 75.0, left: 40, bottom: 20),
              child: ticketDetailsWidget('Statü', 'Öğrenci', 'Saat', saat),
            ),
          ],
        ),
        Container(
          width: 250.0,
          height: 60.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/barcode.png'), fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: Text(
            'PNR Numarası :  $pnrNumber ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            firstTitle,
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              firstDesc,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            secondTitle,
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              secondDesc,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      )
    ],
  );
}
