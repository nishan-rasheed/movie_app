import 'package:flutter/material.dart';
import 'package:movie_app/services/cast_service.dart';

class CastScreen extends StatelessWidget {
  CastScreen({Key? key,
  required this.filmNum}) : super(key: key);
  String filmNum;
  CastService castService = CastService();

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     appBar: AppBar(
      title: const Text('Cast'),
     ),
      body: FutureBuilder(
        future: castService.getCast(filmNum),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4/7,
            ),
            itemCount:snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: maxHeight*.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 ),
                        image: DecorationImage(fit: BoxFit.fill,
                          image:NetworkImage(snapshot.data![index].person!.image!.original.toString()))
                      ),
                    ),
                    Text(snapshot.data![index].person!.name.toString()),
                    Text(snapshot.data![index].person!.gender.toString())
                  ],
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