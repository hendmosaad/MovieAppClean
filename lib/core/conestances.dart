class AppConexstances{
    static String baseUrl="http://api.themoviedb.org/3";
   static String apiKey="88a3b2db8919b99a9c968175b07b1367";
   static String nowPlaying='movie/now_playing';
   static String popularPlaying='movie/popular';
   static String topRated='movie/top_rated';
   static String baseImageUrl='https://image.tmdb.org/t/p/w500';
   static String movieDetails='/movie/';


   static String imageUrl(String path)=>'$baseImageUrl$path';
   static String getMovieDetails( int details)=>'https://api.themoviedb.org/3/movie/${details}?api_key=88a3b2db8919b99a9c968175b07b1367';
   static String getMoviesRecomindations( int movieId)=>'https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=88a3b2db8919b99a9c968175b07b1367';
}
//http://api.themoviedb.org/3/movie/now_playing?api_key=88a3b2db8919b99a9c968175b07b1367
//572802