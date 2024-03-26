import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:umuttepe_turizm/php_servis.dart';
import 'package:umuttepe_turizm/ticketController.dart';

class TicketDetails extends StatefulWidget {
  final String pnrCode;

  TicketDetails({required this.pnrCode});

  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  TicketInfo? ticketInfo;

  Future<void> fetchTicketDetails(String pnrCode) async {
    final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:8080/umuttepe_turizm_admin/services/pnr_control.php?pnr_code=$pnrCode'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        final ticketInfoMap = jsonResponse.first;
        setState(() {
          ticketInfo = TicketInfo.fromJson(ticketInfoMap);
        });
      } else if (jsonResponse is Map<String, dynamic>) {
        setState(() {
          ticketInfo = TicketInfo.fromJson(jsonResponse);
        });
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load ticket details');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTicketDetails(widget.pnrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ticketInfo != null
              ? Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TicketWidget(
                    width: 350,
                    height: 500,
                    child: TicketData(
                      adi: ticketInfo!.passengerName,
                      soyadi: ticketInfo!.passengerLastName,
                      koltuk: ticketInfo!.departureCity,
                      nereden: ticketInfo!.departureCity,
                      nereye: ticketInfo!.arrivalCity,
                      plaka: ticketInfo!.busPlateNumber,
                      pnrCode: ticketInfo!.pnrCode,
                      saat: ticketInfo!.departureTime,
                      tarih: ticketInfo!.departureDate,
                    ),
                  ),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
