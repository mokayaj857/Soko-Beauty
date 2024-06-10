import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/views/gridview_static.dart';

class GalleryPickerExample extends StatefulWidget {
  const GalleryPickerExample({super.key, required this.allmedia});

  final GalleryMedia? allmedia;

  @override
  State<GalleryPickerExample> createState() => _GalleryPickerExampleState();
}

class _GalleryPickerExampleState extends State<GalleryPickerExample> {
  Set<MediaFile> selectedMedia = {};
  bool sortByDate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Gallery"),
        actions: [
          if (selectedMedia.isNotEmpty)
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  selectedMedia.clear();
                });
              },
            ),
          IconButton(
            icon: Icon(sortByDate ? Icons.sort_by_alpha : Icons.date_range),
            onPressed: () {
              setState(() {
                sortByDate = !sortByDate;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedFilesView(
                    selectedMedia: selectedMedia,
                  ),
                ),
              );
            },
          ),
        ],
        elevation: 1,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      ),
      body: MediaView(
        galleryAlbum: widget.allmedia!.albums[0],
        selectedMedia: selectedMedia,
        onMediaSelected: (MediaFile mediaFile) {
          setState(() {
            if (selectedMedia.contains(mediaFile)) {
              selectedMedia.remove(mediaFile);
            } else {
              selectedMedia.add(mediaFile);
            }
          });
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text('Selected Files: ${selectedMedia.length}'),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MediaView extends StatelessWidget {
  const MediaView({
    super.key,
    required this.galleryAlbum,
    required this.selectedMedia,
    required this.onMediaSelected,
  });

  final GalleryAlbum galleryAlbum;
  final Set<MediaFile> selectedMedia;
  final Function(MediaFile) onMediaSelected;

  @override
  Widget build(BuildContext context) {
    var files = galleryAlbum.files;
    return Stack(
      children: [
        ListView(
          children: [
            for (var category in galleryAlbum.dateCategories)
              CategoryView(
                category: category,
                files: files,
                selectedMedia: selectedMedia,
                onMediaSelected: onMediaSelected,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  final TextStyle? textStyle;
  final Widget Function(MediaFile media, BuildContext context)?
      onMediaErrorBuilder;
  final DateCategory category;
  final List<MediaFile> files;
  final Set<MediaFile> selectedMedia;
  final Function(MediaFile) onMediaSelected;

  const CategoryView({
    super.key,
    required this.category,
    required this.files,
    required this.selectedMedia,
    required this.onMediaSelected,
    this.textStyle,
    this.onMediaErrorBuilder,
  });

  int getRowCount() {
    if (category.files.length % 4 != 0) {
      return category.files.length ~/ 4 + 1;
    } else {
      return category.files.length ~/ 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  category.name,
                  style: textStyle,
                ),
              ),
            ),
            GridViewStatic(
              size: MediaQuery.of(context).size.width,
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: <Widget>[
                ...files.map(
                  (medium) => GestureDetector(
                    onTap: () {
                      onMediaSelected(medium);
                    },
                    child: Stack(
                      children: [
                        ThumbnailMedia(
                          media: medium,
                          onErrorBuilder: onMediaErrorBuilder,
                        ),
                        if (selectedMedia.contains(medium))
                          Positioned(
                            top: 5,
                            right: 5,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class SelectedFilesView extends StatelessWidget {
  final Set<MediaFile> selectedMedia;

  const SelectedFilesView({super.key, required this.selectedMedia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Files'),
      ),
      body: ListView.builder(
        itemCount: selectedMedia.length,
        itemBuilder: (context, index) {
          final mediaFile = selectedMedia.elementAt(index);
          return FutureBuilder<File>(
            future: mediaFile.getFile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return ListTile(
                    title: Text('Error loading file'),
                  );
                } else {
                  return ListTile(
                    leading: Image.file(snapshot.data!),
                    // title: Text(mediaFile.name),
                  );
                }
              } else {
                return ListTile(
                  title: Text('Loading...'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
