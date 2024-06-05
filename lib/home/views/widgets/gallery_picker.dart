import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaPickerWithBuilderWidget extends StatefulWidget {
  @override
  _MediaPickerWithBuilderWidgetState createState() =>
      _MediaPickerWithBuilderWidgetState();
}

class _MediaPickerWithBuilderWidgetState
    extends State<MediaPickerWithBuilderWidget> {
  Future<void> requestPermissions() async {
    await [
      Permission.photos,
      Permission.storage,
    ].request();
  }

  Future<void> pickMedia() async {
    await requestPermissions();

    await GalleryPicker.pickMediaWithBuilder(
      multipleMediaBuilder: (media, context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flippers Page'),
          ),
          body: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              for (var mediaFile in media)
                ThumbnailMedia(
                  media: mediaFile,
                )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: "Selected Medias",
                    medias: media,
                  ),
                ),
              );
              GalleryPicker.dispose();
            },
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        );
      },
      heroBuilder: (tag, media, context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flippers Page'),
          ),
          body: Container(
            color: Colors.lightBlueAccent,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: Hero(
              tag: tag,
              child: Image.memory(media.thumbnail!),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: "Selected Medias",
                    medias: [media],
                  ),
                ),
              );
              GalleryPicker.dispose();
            },
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        );
      },
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();
    pickMedia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Show a loading indicator while picking media
      ),
    );
  }
}

class ThumbnailMedia extends StatelessWidget {
  final MediaFile media;

  const ThumbnailMedia({required this.media});

  @override
  Widget build(BuildContext context) {
    return Image.memory(media.thumbnail!);
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<MediaFile> medias;

  const MyHomePage({required this.title, required this.medias});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: medias.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.memory(medias[index].thumbnail!),
          //   title: Text(medias[index].path.split('/').last), // Adjust as needed
          //   subtitle: Text(medias[index].path), // Adjust as needed
           );
        },
      ),
    );
  }
}
