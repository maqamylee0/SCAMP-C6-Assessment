import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class StackedVideoViewModel extends BaseViewModel {

  late VideoPlayerController videoPlayerController;

  void initialize(String videoUrl) {
    videoPlayerController = VideoPlayerController.network(videoUrl);
    videoPlayerController.initialize().then((value) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
  void playVideo(){
    videoPlayerController.play();
    notifyListeners();
  }

  void pauseVideo(){
    videoPlayerController.pause();
    notifyListeners();
  }
}