// Lokasi: lib/models/video_model.dart

class Video {
  final int idVideo;
  final String title;
  final String videoUrl;
  final String durasi;

  Video({
    required this.idVideo,
    required this.title,
    required this.videoUrl,
    required this.durasi,
  });

  // Fungsi sakti untuk mengubah JSON dari Laravel menjadi objek Dart
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      idVideo: json['ID_VIDEO'], // Sesuaikan dengan SQL: ID_VIDEO
      title: json['TITLE'], // Sesuaikan dengan SQL: TITLE
      videoUrl: json['VIDEO_URL'],
      durasi: json['DURASI'],
    );
  }
}
