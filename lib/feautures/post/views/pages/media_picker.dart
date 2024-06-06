import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class BottomSheetExample extends StatefulWidget {
  final Function(List<MediaFile>) onFilesSelected;

  const BottomSheetExample({super.key, required this.onFilesSelected});

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
        // Pass the selected files back to the PostPage
        widget.onFilesSelected(selectedMedias);
        Navigator.pop(context); // Close the bottom sheet
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
    );
  }
}
