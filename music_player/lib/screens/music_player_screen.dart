import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/providers/providers.dart';
import 'package:music_player/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const String routerName = 'music-player';
  const MusicPlayerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),
          Column(
          children: [
              const CustomAppbar(),
              _ImagenDiscoDuracion(),
              _TituloPlay(),
              Expanded(
                child: _Lyrics(),
              )
            ],
          ),
        ]
      ),
    );
  }
}

class _Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(60) ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28)
          ]
        )
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final lyrics = getLyrics();

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 68,
        diameterRatio: 1.5,
        children: lyrics.map(
          (linea) => Text( 
            linea, 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white.withOpacity(0.6)
            )
          )
        ).toList(),
      ),
    );
  }
}

class _TituloPlay extends StatefulWidget {

  @override
  State<_TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<_TituloPlay> with SingleTickerProviderStateMixin {


  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playAnimation = AnimationController(vsync: this, duration: const  Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open() {

    final audioPlayerProvider = Provider.of<AudioPlayerProvider>(context, listen: false);
    assetsAudioPlayer.open(
      Audio('assets/arcangel.mp3'),
      autoStart: true,
      showNotification: true
    );
    assetsAudioPlayer.currentPosition.listen((duration) {
      audioPlayerProvider.current = duration;
      
    });
    assetsAudioPlayer.current.listen((playingAudio) {
      audioPlayerProvider.songDuration = 
        playingAudio?.audio.duration 
        ?? const Duration(seconds: 0);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 50 ),
      margin: const EdgeInsets.only( top: 40 ),
      child: Row(
        children: [
          Column(
            children: [
              Text( 'JS4E', style: TextStyle( fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text( '-Arcangel-', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5)))
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: const Color(0xffF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
            ),
            onPressed: () {
              final audioPlayer = Provider.of<AudioPlayerProvider>(context, listen: false);
              if( isPlaying ) {
                playAnimation.reverse();
                isPlaying = false;
                audioPlayer.controller.stop();
              } else {
                playAnimation.forward();
                isPlaying = true;
                audioPlayer.controller.repeat();
              }
              if ( firstTime ) {
                open();
                firstTime = false;
              } else {
                assetsAudioPlayer.playOrPause();
              }
            },
          )
        ],
      ),
    );
  }
}

class _ImagenDiscoDuracion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      margin: const EdgeInsets.only( top: 70 ),
      child: Row(
        children: [
          _ImagenDisco(),
          const SizedBox( width: 40 ),
          _BarraProgreso(),
          const SizedBox( width: 20 )
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final estilo = TextStyle( color: Colors.white.withOpacity(0.4) );
    final audioPlayerProvider = Provider.of<AudioPlayerProvider>(context);
    final porcentaje = audioPlayerProvider.porcentaje;

    return Container(
      child: Column(
        children: [

          Text( audioPlayerProvider.sonTotalDuration,  style: estilo  ),  
          const SizedBox( height: 10 ),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 230 * porcentaje,
                  color: Colors.white.withOpacity(0.8),
                ),
              )
            ],
          ),
          const SizedBox( height: 10 ),
          Text( audioPlayerProvider.currentSecond,  style: estilo  ),

        ],
      ),
    );
  }
}

class _ImagenDisco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final audioPlayer = Provider.of<AudioPlayerProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24)
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration( seconds: 10 ),
              infinite: true,
              manualTrigger: true,
              controller: ( animationController ) => audioPlayer.controller = animationController,
              child: const Image( image: AssetImage('assets/arcangel.jpeg') )
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          ],
        ),
      ),
    );
  }
}