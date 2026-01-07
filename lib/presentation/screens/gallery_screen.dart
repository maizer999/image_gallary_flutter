import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_string.dart';
import '../widgets/gallery/build_gradiView.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/style/app_color.dart';
import '../../core/utils/screen_config.dart';
import '../widgets/gallery/show_alert_dialog.dart';
import '../widgets/gallery/general_button.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final ValueNotifier<List<File>> imagesNotifier = ValueNotifier([]);

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      imagesNotifier.value = [
        ...imagesNotifier.value,
        ...pickedFiles.map((x) => File(x.path)),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      // 🔹 FIXED BOTTOM UPLOAD BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: GeneralButtonComponent(
          text: 'upload',
          // color: AppColor.gray03,
          image: AppString.arrowUp,
          onPressed: _pickImage,
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/gellary_background.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSize.sv_30,

                  /// 🔹 MAIN IMAGE PREVIEW
                  ValueListenableBuilder<List<File>>(
                    valueListenable: imagesNotifier,
                    builder: (context, images, _) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                          image: images.isNotEmpty
                              ? DecorationImage(
                            image: FileImage(images.first),
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: images.isEmpty
                            ? Center(
                          child: Text(
                            'Tap upload to choose main image',
                            style: GoogleFonts.balooThambi2(
                              fontSize: 16,
                              color: Colors.white10,
                            ),
                          ),
                        )
                            : null,
                      );
                    },
                  ),

                  AppSize.sv_20,

                  /// 🔹 IMAGE GRID
                  Expanded(
                    child: ValueListenableBuilder<List<File>>(
                      valueListenable: imagesNotifier,
                      builder: (context, images, _) {
                        if (images.isEmpty) {
                          return const Center(child: Text('No images yet'));
                        }

                        return BuildGradViewComponent(
                          galleryData: images,
                          onRemove: (index) {
                            imagesNotifier.value = [
                              ...imagesNotifier.value..removeAt(index)
                            ];
                          },
                          onTap: (index) {
                            final selected = images[index];
                            imagesNotifier.value = [
                              selected,
                              ...images.where((e) => e != selected),
                            ];
                          },
                        );
                      },
                    ),
                  ),

                  // space so grid is not hidden by bottom button
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class GalleryUploadImage extends StatelessWidget {
  const GalleryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonComponent(
      text: 'upload',
      // color: AppColor.gray03,
      image: AppString.arrowUp,
      onPressed: () {

        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) => const ShowAlertDialog(),
        );
      },
    );
  }
}
