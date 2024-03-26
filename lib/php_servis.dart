class TicketInfo {
  final String pnrCode;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String departureCity;
  final String arrivalCity;
  final String passengerName;
  final String passengerLastName;
  final String passengerType;
  final String busPlateNumber;

  TicketInfo({
    required this.pnrCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.departureCity,
    required this.arrivalCity,
    required this.passengerName,
    required this.passengerLastName,
    required this.passengerType,
    required this.busPlateNumber,
  });

  factory TicketInfo.fromJson(Map<String, dynamic> json) {
    return TicketInfo(
      pnrCode: json['pnr_code'],
      departureTime: json['departure_time'],
      arrivalTime: json['arrival_time'],
      departureDate: json['departure_date'],
      departureCity: json['departure_city'],
      arrivalCity: json['arrival_city'],
      passengerName: json['name'],
      passengerLastName: json['last_name'],
      passengerType: json['passenger_type'],
      busPlateNumber: json['plate_number'],
    );
  }
}
