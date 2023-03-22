class APIConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '5ba40f59e6a8325930ebab075ccd9e9d';
  static const String nowPlayingEndPoint =
      '${baseUrl}movie/now_playing?api_key=$apiKey';
  static const String popularEndPoint =
      '${baseUrl}movie/popular?api_key=$apiKey';
  static const String topRatedEndPoint =
      '${baseUrl}movie/top_rated?api_key=$apiKey';
}