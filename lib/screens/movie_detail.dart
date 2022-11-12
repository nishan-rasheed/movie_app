import 'package:flutter/material.dart';
import 'package:movie_app/screens/cast_screen.dart';

class MovieDetail extends StatelessWidget {
   MovieDetail({Key? key,
   required this.image,
   required this.name,
   required this.language,
   required this.id,
   required this.summary
  }) : super(key: key);
   
  String image;
  String name;
  String language;
  dynamic id;
  String summary;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Details'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomLeft,
                children: [
                  Container(height: maxHeight*.6,width: maxWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.fill,
                        image:NetworkImage(image)),
                    ),
                  ),
                  Container(padding:const EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.5),
                    height: 100,width: maxWidth,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,style:const TextStyle(
                        fontSize: 22,fontWeight: FontWeight.bold,
                       ),),
                        Text(language,style:const TextStyle(
                          fontSize:18,fontWeight: FontWeight.bold,
                        ),) , 
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => CastScreen(filmNum: id,)));
                  },
                  child: Container(width:maxWidth*.4,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding:const EdgeInsets.all(10),
                    child:const Center(
                      child:  Text('Cast',style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ) , 
              Text(summary,style:const TextStyle(
                fontSize:16,fontWeight: FontWeight.w500,
              ),) ,

            ],
          ),
        ),
      ),
    
    );
  }
}