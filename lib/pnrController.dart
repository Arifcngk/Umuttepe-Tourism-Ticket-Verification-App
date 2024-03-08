import 'package:flutter/material.dart';

class PnrControllerPage extends StatefulWidget {
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

  const PnrControllerPage({
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
  State<PnrControllerPage> createState() => _PnrControllerPageState();
}

class _PnrControllerPageState extends State<PnrControllerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.name,
                      decoration: InputDecoration(
                          labelText: 'İsim', border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.surname,
                      decoration: InputDecoration(
                          labelText: 'Soyisim', border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.name,
                      decoration: InputDecoration(
                          labelText: 'Tel No',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.surname,
                      decoration: InputDecoration(
                          labelText: 'Soyisim', border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.name,
                      decoration: InputDecoration(
                          labelText: 'İsim', border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.surname,
                      decoration: InputDecoration(
                          labelText: 'Soyisim', border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.name,
                      decoration: InputDecoration(
                          labelText: 'İsim', border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.surname,
                      decoration: InputDecoration(
                          labelText: 'Soyisim', border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.name,
                      decoration: InputDecoration(
                          labelText: 'İsim', border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.surname,
                      decoration: InputDecoration(
                          labelText: 'Soyisim', border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
