import 'package:flutter/material.dart';

class QrCodeCodePage extends StatefulWidget {
  final String name;
  final String surname;
  final String tc;
  final String phone;
  final String busPlate;
  final String busTime;
  final String from;
  final String to;
  final String hour;
  final String seatNo;

  const QrCodeCodePage({
    Key? key,
    required this.name,
    required this.surname,
    required this.tc,
    required this.phone,
    required this.busPlate,
    required this.busTime,
    required this.from,
    required this.to,
    required this.hour,
    required this.seatNo,
  }) : super(key: key);

  @override
  State<QrCodeCodePage> createState() => _QrCodeCodePageState();
}

class _QrCodeCodePageState extends State<QrCodeCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3DB),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: widget.name,
              decoration: InputDecoration(labelText: 'İsim'),
            ),
            TextFormField(
              initialValue: widget.surname,
              decoration: InputDecoration(labelText: 'Soyisim'),
            ),
            TextFormField(
              initialValue: widget.tc,
              decoration: InputDecoration(labelText: 'TC'),
            ),
            TextFormField(
              initialValue: widget.phone,
              decoration: InputDecoration(labelText: 'Telefon'),
            ),
            TextFormField(
              initialValue: widget.busPlate,
              decoration: InputDecoration(labelText: 'Otobüs Plakası'),
            ),
            TextFormField(
              initialValue: widget.busTime,
              decoration: InputDecoration(labelText: 'Otobüs Saati'),
            ),
            TextFormField(
              initialValue: widget.from,
              decoration: InputDecoration(labelText: 'Nereden'),
            ),
            TextFormField(
              initialValue: widget.to,
              decoration: InputDecoration(labelText: 'Nereye'),
            ),
            TextFormField(
              initialValue: widget.hour,
              decoration: InputDecoration(labelText: 'Saat'),
            ),
            TextFormField(
              initialValue: widget.seatNo,
              decoration: InputDecoration(labelText: 'Koltuk No'),
            ),
          ],
        ),
      ),
    );
  }
}
