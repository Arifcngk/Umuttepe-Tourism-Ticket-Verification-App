import 'package:flutter/material.dart';
import 'package:umuttepe_turizm/pnr_kontrol.dart';
import 'package:umuttepe_turizm/pnrController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void pnrCozucu(String pnr) {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF2E3DB),
        appBar: AppBar(
          backgroundColor: Color(0xFF263A29),
          title: Text("Umuttepe Turizm"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BtnWidget(
                btnName: "QR OKUT",
                icon: Icons.qr_code,
                color: Colors.black,
                onPressed: () {
                  // QR OKUT butonuna tıklandığında yapılacak işlemler
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PnrControllerPage(
                          busPlate: "Aa",
                          busTime: "",
                          from: "Gebze",
                          hour: "12",
                          name: "Arif",
                          phone: "7463272",
                          seatNo: "3",
                          surname: "Gök",
                          tc: "12132312",
                          to: "İstalbul",
                        ),
                      ));
                },
              ),
              SizedBox(height: 20),
              BtnWidget(
                btnName: "PNR GİR",
                icon: Icons.text_decrease,
                color: Color(0xFFB4B4B8),
                onPressed: () {
                  // PNR GİR butonuna tıklandığında yapılacak işlemler
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("PNR Numarasını Giriniz"),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 50), // form genişlik ve yükseklik
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'PNR Numarası',
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PnrControl()),
                                );
                              },
                              icon: Icon(Icons.approval),
                              label: Text("Onayla"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Color(0xFF263A29),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              BtnWidget(
                btnName: "YARDIM",
                icon: Icons.help,
                color: Colors.red,
                onPressed: () {
                  // YARDIM butonuna tıklandığında yapılacak işlemler
                  print("YARDIM butonuna tıklandı");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    Key? key,
    required this.btnName,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String btnName;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(btnName),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Butonun kenarlarını oval yapar
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
        backgroundColor: color,
        // Butonun genişliği ve yüksekliği ayarlanır
      ),
    );
  }
}
