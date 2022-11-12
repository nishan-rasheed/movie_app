import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail.dart';
import 'package:movie_app/services/movie_service.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  MovieService movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Movies'),
        actions:const [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),),
          )
        ],
        ),
      body: FutureBuilder(
        future: movieService.getMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4/7
            ),
            itemCount:snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {


              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context) => MovieDetail(
                   image: snapshot.data![index].image!.original.toString(),
                   name: snapshot.data![index].name.toString(),
                   language: snapshot.data![index].language.toString(),
                   id: snapshot.data![index].id.toString(),
                   summary:snapshot.data![index].summary.toString(),

                  ) ));
                },
                child: Container(
                  padding:const EdgeInsets.all(5),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                      height: maxHeight*.3,
                      width:maxWidth ,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage(snapshot.data![index].image!.original.toString()))
                    ),
                  ),
                   Text(snapshot.data![index].name.toString(),style:const TextStyle(
                    fontSize: 18,
                  ),),
                  Text(snapshot.data![index].genres![0].toString())
                    ],
                  ),
                ),
              );
            },
        ),
          );
        },
      ),
    );
  }
}