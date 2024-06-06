import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:gallery_picker/gallery_picker.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  List<MediaFile> selectedMedias = [];
  int pageIndex = 0;
  var controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    // Open gallery picker initially when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GalleryPicker.openSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PickerScaffold(
      backgroundColor: Colors.black,
      onSelect: (List<MediaFile> selectedMedias) {
        this.selectedMedias = selectedMedias;
        pageIndex = 0;
        if (this.selectedMedias.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            controller.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          });
        }
        setState(() {});
      },
      config: Config(
        permissionDeniedPage: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                "Permission Denied",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please allow the storage permission",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        mode: Mode.dark,
      ),
      bottomSheetMinHeight: 100,
      // appBar: AppBar(
      //   title: const Text('Gallery Picker'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(Icons.camera_alt),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Stack(children: [
                if (selectedMedias.isNotEmpty)
                  PageView(
                    controller: controller,
                    children: [
                      for (var media in selectedMedias)
                        Center(
                          child: MediaProvider(
                            media: media,
                          ),
                        )
                    ],
                  ),
                if (selectedMedias.length > 1)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: pageIndex < selectedMedias.length - 1
                          ? () {
                              pageIndex++;
                              controller.animateToPage(pageIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              setState(() {});
                            }
                          : null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (selectedMedias.length > 1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: pageIndex > 0
                          ? () {
                              pageIndex--;
                              controller.animateToPage(pageIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              setState(() {});
                            }
                          : null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ]),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < selectedMedias.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                        onPressed: () {
                          pageIndex = i;
                          controller.animateToPage(pageIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          setState(() {});
                        },
                        child: Container(
                            width: 65,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: pageIndex == i
                                        ? Colors.red
                                        : Colors.black)),
                            child: ThumbnailMedia(
                              media: selectedMedias[i],
                            )),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
