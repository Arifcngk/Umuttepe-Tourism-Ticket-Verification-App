import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PNRInfoScreen extends StatefulWidget {
  @override
  _PNRInfoScreenState createState() => _PNRInfoScreenState();
}

class _PNRInfoScreenState extends State<PNRInfoScreen> {
  TextEditingController _idController = TextEditingController();
  Map<String, dynamic>? _pnrInfo;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _getPNRInfo() async {
    final id = _idController.text;

    if (id.isEmpty) {
      setState(() {
        _errorMessage = 'ID numarası boş olamaz.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _pnrInfo = null;
    });

    try {
      final response = await http.post(
        Uri.parse(
            "http://10.0.2.2:8080/flutter_api/pnrContoller.php"), // Sunucu URL'nizi buraya ekleyin
        body: {'id': id},
      );

      if (response.statusCode == 200) {
        setState(() {
          _pnrInfo = json.decode(response.body);
        });
      } else {
        setState(() {
          _errorMessage = 'Bir hata oluştu. Lütfen tekrar deneyin.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Bir hata oluştu: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PNR Bilgi Sorgulama'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID Seçiniz'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getPNRInfo,
              child: Text('Bilgiyi Getir'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _errorMessage != null
                    ? Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red),
                      )
                    : _pnrInfo != null
                        ? Expanded(
                            child: ListView(
                              children: [
                                _buildInfoTile(
                                    'Nereden', _pnrInfo!['nereden'] ?? ''),
                                _buildInfoTile(
                                    'Nereye', _pnrInfo!['nereye'] ?? ''),
                                _buildInfoTile('Adı', _pnrInfo!['adi'] ?? ''),
                                _buildInfoTile(
                                    'Soyadı', _pnrInfo!['soyadi'] ?? ''),
                                _buildInfoTile(
                                    'Tarih', _pnrInfo!['tarih'] ?? ''),
                                _buildInfoTile(
                                    'Plaka', _pnrInfo!['plaka'] ?? ''),
                                _buildInfoTile(
                                    'Koltuk', _pnrInfo!['koltuk'] ?? ''),
                                _buildInfoTile('Saat', _pnrInfo!['saat'] ?? ''),
                                _buildInfoTile(
                                    'Statü', _pnrInfo!['statü'] ?? ''),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
