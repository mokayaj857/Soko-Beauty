import 'package:flutter/material.dart';

class CameraControls extends StatelessWidget {
  final bool disableButtons;
  final Function() onDurationLimitTap;
  final String recordDurationLimit;
  final bool isCameraReady;
  final bool deactivateRecordButton;
  final Widget recordButton;
  final Function() onGalleryTap;

  const CameraControls({
    Key? key,
    required this.disableButtons,
    required this.onDurationLimitTap,
    required this.recordDurationLimit,
    required this.isCameraReady,
    required this.deactivateRecordButton,
    required this.recordButton,
    required this.onGalleryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: !disableButtons ? onDurationLimitTap : null,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: !disableButtons
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white.withOpacity(0.1),
                    radius: 25,
                    child: FittedBox(
                      child: Text(
                        recordDurationLimit,
                        style: TextStyle(
                          color: !disableButtons
                              ? Colors.white
                              : Colors.grey.withOpacity(0.4),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: !isCameraReady || deactivateRecordButton,
              child: Opacity(
                opacity: !isCameraReady || deactivateRecordButton ? 0.4 : 1,
                child: recordButton,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 60),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  radius: 25,
                  child: IconButton(
                    onPressed: onGalleryTap,
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
