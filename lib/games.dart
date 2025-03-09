import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async'; 
import 'package:path/path.dart' as p;

String path = p.current;
String result = path.replaceAll("\\", "/");
String currentString = result; // This is only here for testing paths

/*Future<void> runGame(String game, String gameType, String emuLoaction, String emulator) async { // Use this one for the build
  // This works on Windows/Linux/Mac


  if(gameType == "n64Games"){
    //C:/Users/0123x/StudioProjects/vsflutter/build/windows/x64/runner/Release
    //print('''data/flutter_assets/assets/$emuLoaction/$emulator "$result/data/flutter_assets/assets/$gameType/$game"''');
    await Process.run('''data/flutter_assets/assets/$emuLoaction/$emulator "$result/data/flutter_assets/assets/$gameType/$game"''', []);
}
  else{
  await Process.run('''data/flutter_assets/assets/$emuLoaction/$emulator "data/flutter_assets/assets/$gameType/$game"''', []);
  }

}*/
Future<void> runGame(String game, String gameType, String emuLoaction, String emulator) async { //Use this one for general testing
  // This works on Windows/Linux/Mac

  if(gameType == "n64Games"){
    
    String path = p.current;
    String result = path.replaceAll("\\", "/");

    await Process.run('''assets/$emuLoaction/$emulator "$result/assets/$gameType/$game"''', []);
    print('''assets/$emuLoaction/$emulator "$result/$gameType/$game"''');
}
  else{
    await Process.run('''assets/$emuLoaction/$emulator "assets/$gameType/$game"''', []);
  }
  //shell = shell.popd();
  //currentString = game;
}


class Game {
  String name;
  String gameType;
  String image;
  String emulator;
  String emuLocation;

  Game(this.name, this.gameType, this.image, this.emuLocation, this.emulator);
}

Game nes1 = Game("Super_Mario_Bros.nes", "nesGames", "assets/NESLogos/Super_Mario_Bros.jpg", "Mesen", "Mesen.exe");

Game snes1 = Game("Super_Mario_World.sfc", "snesGames", "assets/SNESLogos/Super_Mario_World.jpg", "Mesen", "Mesen.exe");

Game gb1 = Game("Pokemon_red.gb", "gbGames", "assets/GBLogos/Pokemon_Red.jpg", "MGBA", "mGBA.exe");

Game gbc1 = Game("Pokemon_Crystal.gbc", "gbcGames", "assets/GBCLogos/Pokemon_Crystal.jpg", "MGBA", "mGBA.exe");

Game gba1 = Game("FireEmblem(USA,Australia).gba", "gbaGames", "assets/GBALogos/Fire_Emblem_Blazing_Blade.jpg", "MGBA", "mGBA.exe");
Game gba2 = Game("Space_Invaders.gba", "gbaGames", "assets/GBALogos/Space_Invaders.jpg", "MGBA", "mGBA.exe");

Game n641 = Game("Legend_of_Zelda_Majora's_Mask.z64", "n64Games","assets/N64Logos/The_Legend_of_Zelda_MM.jpg", "Project64", "Project64");
Game n642 = Game("Legend_of_Zelda_Ocarina_of_Time.z64", "n64Games", "assets/N64Logos/The_Legend_of_Zelda_OOT.jpg", "Project64", "Project64");

Game ds1 = Game("Phoenix_Wright_Ace_Attorney_Trials_and_Tribulations.nds", "dsGames", "assets/DSLogos/Trials_and_Tribulations_DS.jpg", "Desmume", "DeSmuME_0.9.11_x64.exe");

List<Game>allGames = [nes1, snes1, gb1, gbc1, gba1, gba2, n641, n642, ds1];

List<Game>gbcGames = [gbc1];
List<Game>gbaGames = [gba1];
List<Game>n64Games = [n641, n642];
List<Game>snesGames = [snes1];
List<Game>nesGames = [];
List<Game>dsGames = [ds1];

class GameCard extends StatefulWidget {
  //final int index;
  final Game item;


  const GameCard(this.item);

  @override
  GameCardState createState() => GameCardState();

}

/// This is the private State class that goes with MyStatefulWidget.
class GameCardState extends State<GameCard> {
    
    bool showLogo = false;
    String currentImage = "assets/icons/nintendo64_icon.jpg";

    /*regex 
    .+(\.gb)
    .+(\.gbc)
    .+(\.gba)
    .+(\.nds)
    .+(\.z64)
    
    
    */
    void test(PointerEvent details){ 
      setState(() {
        showLogo = true;

      });
      }  
    void test2(PointerEvent details){
      setState(() {
        showLogo = false; 
      });
       }
    Widget newImage(Game currentGame ){

      if(showLogo){
        if(RegExp(r'.+(\.nes)').hasMatch(currentGame.name)){
          return const Image(image: AssetImage("assets/icons/nes_icon.png"), width: 50, height: 50,);
        }
        if(RegExp(r'.+(\.sfc)').hasMatch(currentGame.name)){
          return const Image(image: AssetImage("assets/icons/snes_icon.png"), width: 50, height: 50,);
        }
        if(RegExp(r'.+(\.z64)').hasMatch(currentGame.name)){
          return const Image(image: AssetImage("assets/icons/nintendo64_icon3.png"), width: 50, height: 50,);
        }
        if(RegExp(r'.+(\.gb)').hasMatch(currentGame.name)){
          return const Image(image: AssetImage("assets/icons/gba_icon.png"), width: 50, height: 50,);
        }
        if(RegExp(r'.+(\.nds)').hasMatch(currentGame.name)|| RegExp(r'.+(\.dsv)').hasMatch(currentGame.name)){
          return const Image(image: AssetImage("assets/icons/nintendods_icon2.png"), width: 50, height: 50,);
        }
  

        return const Image(image: AssetImage("assets/icons/nintendods_icon.png"), width: 50, height: 50,);
      }
      else{return const Text("");}
    }

    void setLogo(){
      setState(() {

      if(showLogo){currentImage = "assets/icons/nintendo64_icon3.png";}

      else{currentImage = "assets/icons/test_icon.jpg";}
      });
    }


  @override
  Widget build(BuildContext context) {
    return  MouseRegion(
        onEnter: test,
        onExit: test2,
        //cursor: SystemMouseCursors.allScroll,
          child:Row(children: [
            newImage(widget.item),
            IconButton(onPressed: (){runGame(widget.item.name, widget.item.gameType, 
            widget.item.emuLocation, widget.item.emulator);
             setState(() {
              currentString = result;
            });},
            icon: Image.asset(widget.item.image, width: 100, height: 100,),),
                ]),
      );
  }
}