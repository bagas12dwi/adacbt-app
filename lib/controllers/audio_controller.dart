import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer player = AudioPlayer();
  RxBool isPlaying = false.obs;

  Future<void> playAudio(String audioUrl) async {
    isPlaying.value = true; // Update the value of isPlaying to true
    await player.setUrl(audioUrl);
    await player.play();
  }

  Future<void> pauseAudio() async {
    isPlaying.value = false; // Update the value of isPlaying to false
    await player.pause();
  }

  PlayerState get playerState => player.playerState;
}