import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class songview extends StatefulWidget {
  String imagepath;
  String Sname;
  String name;
  String mainname;
  String songs;
  final List<dynamic> EDMdoc;
  int lenth;
   songview({
    
    required this.imagepath,
    required this.Sname,
    required this.name,
        required this.mainname,
    required this.EDMdoc,
    required this.lenth,
    required this.songs,
    super.key});




  @override
  State<songview> createState() => _songviewState();
}

class _songviewState extends State<songview> {
    final AudioPlayer audioplayer=AudioPlayer();
    bool isplaying=false;


    Duration position=Duration.zero;

    Duration duration=Duration.zero;
     int currentIndex = 0;



     @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    audioplayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    audioplayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });

    audioplayer.onPlayerComplete.listen((event) {
      // Handle completion, e.g., move to the next song
      updateSongDetails();
    });
  }

@override
void dispose() {
  super.dispose();
  audioplayer.pause();
}


  @override
  Widget build(BuildContext context) {
  double containerHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      appBar: AppBar(
        title: Center(child: Text("Sinhala Mix",style: TextStyle(color: Colors.white,fontSize: 15),)),
        leading: IconButton(onPressed:() {
         audioplayer.pause();
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)),
        actions: [
          IconButton(onPressed:() {
          }, icon: Icon(Icons.home,color: Colors.white,))
        ],
        backgroundColor: Colors.transparent,
      ),
body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
          child: Container(
           width: double.infinity,
           height: containerHeight,
           decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(widget.imagepath),fit: BoxFit.cover),
          
            borderRadius: BorderRadius.circular(13)
           ),
          
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            width: double.infinity,
            height: containerHeight/5,
          
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.Sname,style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                Text(widget.name,style: TextStyle(color: const Color.fromARGB(154, 255, 255, 255),fontSize: 18),)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: Slider(
            thumbColor: Colors.white,
            activeColor: Colors.white,
            min: 0,
            max: duration.inSeconds.toDouble(),
            value:position.inSeconds.toDouble(),
             onChanged:(value) async {

                      
              setState(() {
                audioplayer.seek(position);
             position=Duration(seconds: value.toInt());

              });
              
             },
             
             ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35,right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(formatTime(position),style: TextStyle(color: Colors.white),),
             Text(formatTime(duration-position),style: TextStyle(color: Colors.white),)
          
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 IconButton(onPressed:() {
                  audioplayer.stop();
                   previoussonglist();
                 }, icon:Icon(Icons.skip_previous),color: Colors.white,iconSize: containerHeight/7,),
                 CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: IconButton(onPressed:() async {
                  if (isplaying) {
                      audioplayer.pause();
                    } else {
                      audioplayer.play(UrlSource(widget.songs));
                    }
                    setState(() {
                      isplaying = !isplaying;
                    });

                    
                  }, icon:Icon(
                    isplaying ? Icons.pause:Icons.play_arrow
                  ),color: Color.fromARGB(255, 0, 0, 0),iconSize: containerHeight/8,),
          
                 ),
                  IconButton(onPressed:() {
audioplayer.pause();
                   updateSongDetails();

                    
                    
                 }, icon:Icon(Icons.skip_next),color: Colors.white,iconSize: containerHeight/7,),
          
          
            ],
          ),
        )
      
      
      ],
      
    ),
  ),
),






    );
    
  }

String formatTime(Duration position) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(position.inHours);
  final minutes = twoDigits(position.inMinutes.remainder(60));
  final seconds = twoDigits(position.inSeconds.remainder(60));

  return [
    if (position.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
  
}
 void updateSongDetails() {

  


  
    if (currentIndex < widget.lenth-1) {
      setState(() {

 isplaying=false;
      currentIndex++;
      final nextSong = widget.EDMdoc[0][currentIndex];
      widget.imagepath = nextSong[2];
      widget.Sname = nextSong[1];
      widget.name = nextSong[0];
      widget.songs=nextSong[4];
      widget.mainname = widget.mainname;

          });
    }
 
  }

  void previoussonglist(){
if (widget.lenth>currentIndex && currentIndex>0) {
  setState(() {
      isplaying=false;
      currentIndex--;
      final nextSong = widget.EDMdoc[0][currentIndex];
      widget.imagepath = nextSong[2];
      widget.Sname = nextSong[1];
      widget.name = nextSong[0];
      widget.songs=nextSong[4];
      widget.mainname = widget.mainname;
          });

  
}



  }
}