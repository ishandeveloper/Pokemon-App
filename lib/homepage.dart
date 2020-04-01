import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/Screens/poke_detail.dart';
import 'package:pokemon_app/pokedox.dart';
import 'dart:convert';
import 'widgets/drawer.dart';
import 'widgets/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var url="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokeHub;
  @override 
  
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async{
   var res= await http.get(url);
   var decodedJSON= jsonDecode(res.body);
   pokeHub=PokeHub.fromJson(decodedJSON);
  setState(() {
    
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "MY POKEMON'S",
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[900],
        onPressed: () {
          initState();
        },
      ),
      drawer: AppDrawer(),
      body:pokeHub==null?Center(child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),):GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke)=>
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PokeDetail(
                pokemon:poke
              )));
            },
            child: Hero(
              tag:poke.img,
              child: Card(
              elevation: 30.0,
              // color:Colors.red[900],
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image:DecorationImage(image: NetworkImage(poke.img))
                        ),

                    ),
                    SizedBox(height:10),
                    Text(poke.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                ],
                ),
              ),
            
            ),
                      ),
          ),
        )).toList(),
        )
    );
  }
}
