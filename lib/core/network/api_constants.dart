class APIConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '5ba40f59e6a8325930ebab075ccd9e9d';
  static const String nowPlayingEndPoint =
      '${baseUrl}movie/now_playing?api_key=$apiKey';
  static const String popularEndPoint =
      '${baseUrl}movie/popular?api_key=$apiKey';
  static const String topRatedEndPoint =
      '${baseUrl}movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl =
      'https://image.tmdb.org/t/p/w500';
      static String imageUrl(String path)=>'$baseImageUrl$path';
      static String movieDetailsPath(int movieId)=>'${baseUrl}movie/$movieId?api_key=$apiKey';
      static String recommendationMoviesPath(int movieId)=>'${baseUrl}movie/$movieId/recommendations?api_key=$apiKey';
}
