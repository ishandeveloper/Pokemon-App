import 'package:flutter/material.dart';
import 'package:pokemon_app/pokedox.dart';
import 'package:pokemon_app/widgets/drawer.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});
  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
          height: MediaQuery.of(context).size.height/1.5,
          width:  MediaQuery.of(context).size.width-60,
          left:30,
          top: MediaQuery.of(context).size.height*0.1,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                // color:Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 50,),
              Text(pokemon.name,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              Text("Height: ${pokemon.height}",style:TextStyle(fontSize: 16)),
              Text("Weight: ${pokemon.weight}",style:TextStyle(fontSize: 16)),
              Text("Types",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map(
                  (t)=>FilterChip(
                    label: Text(t),
                    backgroundColor:Colors.green,
                    
                    onSelected: (b){})
                ).toList(),

              ),

              Text("Weakness",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map(
                  (t)=>FilterChip(
                    label: Text(t),
                    backgroundColor:Colors.red,
                    
                    onSelected: (b){})
                ).toList(),

              ),

              Text("Next Evolution",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution!=null?pokemon.nextEvolution.map(
                  (n)=>FilterChip(
                    label: Text(n.name),
                    backgroundColor:Colors.blue[300],
                    
                    onSelected: (b){})
                ).toList():List(),

              ),

            ],
            ),
        ),
      ),
      
      Align(
        alignment:Alignment.topCenter,
        child:Hero(
          tag: pokemon.img,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image:DecorationImage(image:NetworkImage(pokemon.img),fit: BoxFit.cover)
            ),
            ),
          )
        )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(pokemon.name,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
        backgroundColor: Colors.black,
        // centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.red,
          // opacity: 0
          ),
      ),
      body:bodyWidget(context),
      backgroundColor: Colors.black,
    );
  }
}