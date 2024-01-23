class Track {
  final String id;
  final String artist;
  final String artist_name;
  final String artwork;
  final String name;
  final String duration;
  final String source;
  final String genre_name;

  Track(
      {required this.id,
      required this.artist,
      required this.artist_name,
      required this.artwork,
      required this.name,
      required this.duration,
      required this.source,
      required this.genre_name});

  static List<Track> trackStatic =  [

    Track(
        id: "0koZTWTtNAcpl4Li2LyL",
        artist: "LocgbwxhAlk8OiR97GNh",
        artist_name: "Billie Eilish",
        //artwork: 'https://media.glamourmagazine.co.uk/photos/64ccca835c915d8a7f4f8bb8/16:9/w_2240,c_limit/BILLIE%20EILISH%20040823%20DEFAULT-GettyImages-1201586589.jpg',
        artwork: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
        name: "Bad Guy",
        duration: "0:35",
        source: 'assets/music/billie_eilish.mp3',
        genre_name: "Hip Hop"),

    Track(
        id: "KN4HhPqtyvnEw8IKyI2c",
        artist: "LocgbwxhAlk8OiR97GNh",
        artist_name: "Camila Cabello",
        //artwork: 'https://images.genius.com/b64f4b92ee081fd0c1d5390aabc155d6.1000x1000x1.jpg',
        artwork: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
        name: "Havana Remix",
        duration: "0:30",
        source: 'assets/music/havana.mp3',
        genre_name: "Hip Hop"),

    Track(
        id: "dDeMW3crSTTDGW8HkSeS",
        artist: "LocgbwxhAlk8OiR97GNh",
        artist_name: "Suzume",
        //artwork: 'https://m.media-amazon.com/images/M/MV5BMTg5ODA4MTY1OV5BMl5BanBnXkFtZTcwODYwMzAzMQ@@._V1_.jpg',
        artwork: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
        name: "Suzume No Toji",
        duration: "0:30",
        source: "assets/music/suzume.mp3",
        genre_name: "Hip Hop")

  ];

}