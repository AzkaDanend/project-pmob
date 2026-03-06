class Mentor {
  final int idBooking;
  final String nama;
  final String spesialisasi;
  final int statusAktif;

  Mentor({
    required this.idBooking,
    required this.nama,
    required this.spesialisasi,
    required this.statusAktif,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      idBooking: json['ID_BOOKING'],
      nama: json['NAMA'],
      spesialisasi: json['SPESIALISASI'],
      statusAktif: json['STATUS_AKTIF'],
    );
  }
}
