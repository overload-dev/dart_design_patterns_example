import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/composite/components/audio_file.dart';
import 'package:dart_design_patterns_example/pages/composite/components/directory.dart';
import 'package:dart_design_patterns_example/pages/composite/components/image_file.dart';
import 'package:dart_design_patterns_example/pages/composite/components/text_file.dart';
import 'package:dart_design_patterns_example/pages/composite/components/video_file.dart';
import 'package:flutter/material.dart';

class CompositeScreen extends StatelessWidget {
  static String routeName = '/composite_screen';

  const CompositeScreen({Key? key}) : super(key: key);

  Widget buildMediaDirectory() {
    var musicDirectory = Directory(title: 'Music');

    musicDirectory.addFile(const AudioFile(title: 'Darude - Sandstorm.mp3', size: 2612453,));
    musicDirectory.addFile(const AudioFile(title: 'Toto - Sandstorm.mp3', size: 3219811,));
    musicDirectory.addFile(const AudioFile(title: 'Bag Raiders - Shooting Stars.mp3', size: 3219811,));


    var movieDirectory = Directory(title: 'Movies');

    movieDirectory.addFile(const VideoFile(title: 'The Matrix.avi', size: 951495532));
    movieDirectory.addFile(const VideoFile(title: 'The Matrix Reloaded.mp4', size: 1251495532));

    var catPicturesDirectory = Directory(title: 'Cats');
    catPicturesDirectory.addFile(const ImageFile(title: 'Cat 1.jpg', size: 844497));
    catPicturesDirectory.addFile(const ImageFile(title: 'Cat 2.jpg', size: 975363));
    catPicturesDirectory.addFile(const ImageFile(title: 'Cat 3.jpg', size: 1975363));

    var picturesDirectory = Directory(title: 'Pictures');

    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(const ImageFile(title: 'Not a cat.png', size: 2971361));

    var mediaDirectory = Directory(title: 'Media', isInitiallyExpanded: true);

    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(movieDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory.addFile(Directory(title: 'New Folder',));
    mediaDirectory.addFile(const TextFile(title: 'Nothing suspicious there.txt', size: 430791));
    mediaDirectory.addFile(const TextFile(title: 'TeamTrees.txt', size: 1042,));

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Template Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: buildMediaDirectory(),
        ),
      ),
    );
  }
}
