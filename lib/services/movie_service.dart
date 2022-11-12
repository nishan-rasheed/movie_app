import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService{
  List <MovieModel> movies = [];
  Future<List<MovieModel>> getMovies()async{
   final url = 'https://api.tvmaze.com/shows';
   final response = await http.get(Uri.parse(url));
   if (response.statusCode == 200) {
    final List movieList = jsonDecode(response.body);
    movies = movieList.map((e) => MovieModel.fromJson(e)).toList();
    //  print(response.body);
   }
   return movies;
  }
  
}