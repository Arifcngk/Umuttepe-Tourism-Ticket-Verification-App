import 'package:flutter/material.dart';
import 'package:umuttepe_turizm/bilet_detay.dart';
import 'package:umuttepe_turizm/ticketController.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String qrText =
      'QR kod sonucu burada gösterilecek'; // QR kodu sonucunu tutacak değişken

  var pnr;

  // QR kodu tarayıcı işlevi
  Future<void> scanQR() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'İptal', true, ScanMode.QR);
    if (!mounted) return;
    setState(() {
      qrText = barcodeScanRes; // QR kodu sonucunu güncelle
    });

    // Okunan QR kodunu yeni sayfaya aktar
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetails(
          pnrCode: pnr,
        ),
      ),
    );
  }

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
                  scanQR();
                  // QR OKUT butonuna tıklandığında yapılacak işlemler
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
                          horizontal: 34, vertical: 50),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextFormField(
                            // PNR numarası girişi için text form field
                            decoration: const InputDecoration(
                              labelText: 'PNR Numarası',
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) {
                              pnr =
                                  value; // Kullanıcının girdiği PNR numarasını al
                            },
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
                                    builder: (context) => TicketDetails(
                                        pnrCode:
                                            pnr), // PNR numarasını parametre olarak geçir
                                  ),
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
