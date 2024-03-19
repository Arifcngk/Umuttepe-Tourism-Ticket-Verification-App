import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class MyTicketView extends StatefulWidget {
  final String pnrNumber;

  const MyTicketView({Key? key, required this.pnrNumber}) : super(key: key);

  @override
  State<MyTicketView> createState() => _MyTicketViewState();
}

class _MyTicketViewState extends State<MyTicketView> {
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
            child: TicketData(pnrNumber: widget.pnrNumber),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}

class TicketData extends StatelessWidget {
  final String pnrNumber;

  const TicketData({Key? key, required this.pnrNumber}) : super(key: key);

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
            const Row(
              children: [
                Text(
                  'Kocaeli',
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
                    'Sakarya',
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
                  'Adı-Soyadı:', 'Arif Can Gök', 'Tarih:', '28-08-2024'),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 45.0, left: 40),
              child: ticketDetailsWidget(
                  'Araç Plakası:', '34TG2638', 'Koltuk No:', '66B'),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 75.0, left: 40, bottom: 20),
              child: ticketDetailsWidget('Statü', 'Öğrenci', 'Saat', '13.00'),
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
