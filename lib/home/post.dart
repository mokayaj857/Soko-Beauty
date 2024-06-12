import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_beauty/core/utils/camera_utils.dart';
import 'package:soko_beauty/core/utils/permission_utils.dart';
import 'package:soko_beauty/core/views/widgets/custom_snackbar.dart';
import 'package:soko_beauty/feautures/post/pages/take_video.dart';
import 'package:soko_beauty/feautures/post/pages/upload_post.dart';
import 'package:soko_beauty/feautures/post/services/camera_bloc.dart';

// ignore: must_be_immutable
class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.1))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          _buildListTile(
            context,
            icon: Icons.camera_alt,
            title: 'Camera',
            subtitle: 'Take a video using your camera',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) {
                      return CameraBloc(
                        cameraUtils: CameraUtils(),
                        permissionUtils: PermissionUtils(),
                      )..add(const CameraInitialize(recordingLimit: 15));
                    },
                    child: const CameraPage(),
                  ),
                ),
              );
            },
          ),
          _buildListTile(context,
              icon: Icons.photo_library,
              title: 'Gallery',
              subtitle: 'Choose a video from the gallery', onTap: () async {
            Future<void> pickVideo() async {
              // Use FilePicker to select a video file from the gallery
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.video,
                allowMultiple: false,
              );
              Navigator.pop(context);

              if (result != null && result.files.single.path != null) {
                // Navigate to upload page with the selected video
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadPage(
                      videoFile: File(result.files.single.path!),
                    ),
                  ),
                );
              } else {
                CustomSnackbar.show(context, 'info', 'No video selected');
              }
            }

            pickVideo();
          }),
          _buildListTile(
            context,
            icon: Icons.scanner,
            title: 'AI Scanner',
            subtitle: 'Scan using AI-powered scanner',
            onTap: () {
              // Handle AI scanner action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).highlightColor.withOpacity(0.0),
        child: Icon(icon, size: 45, color: Theme.of(context).primaryColor),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
    );
  }
}
