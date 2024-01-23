import 'track_model.dart';

class Playlist {
  final String title;
  final List<Track> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Random Mix',
      songs: Track.trackStatic,
      imageUrl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
      //imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTg5ODA4MTY1OV5BMl5BanBnXkFtZTcwODYwMzAzMQ@@._V1_.jpg',
    ),
  ];
}
