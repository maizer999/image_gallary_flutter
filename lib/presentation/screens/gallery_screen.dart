import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/routers/app_routers.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/enum.dart';
import '../controller/galleryBloc/gallery_bloc.dart';
import '../widgets/gallery/build_gradiView.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/cache_helper.dart';
import '../../core/style/app_color.dart';
import '../../core/utils/screen_config.dart';
import '../controller/Login/login_bloc.dart';
import '../controller/galleryBloc/gallery_state.dart';
import '../widgets/gallery/show_alert_dialog.dart';
import '../widgets/gallery/general_button.dart';


class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  // Local list of images
  final ValueNotifier<List<File>> imagesNotifier = ValueNotifier([]);

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagesNotifier.value = [...imagesNotifier.value, File(pickedFile.path)];
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: Colors.green,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/gellary_background.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome \n User',
                        style: GoogleFonts.balooThambi2(
                          fontSize: 30,
                          height: 0.9,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray02,
                        ),
                      ),
                      const Spacer(),
                      // const CircleAvatar(
                      //   radius: 30,
                      //   backgroundImage:
                      //   AssetImage('assets/images/user_placeholder.png'),
                      // ),
                    ],
                  ),
                  AppSize.sv_60,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralButtonComponent(
                        text: 'log out',
                        color: Colors.red,
                        onPressed: () {
                          // Add your log out logic here
                        },
                        image: AppString.arrowLeft,
                      ),
                      AppSize.sh_20,
                      GeneralButtonComponent(
                        text: 'upload',
                        color: AppColor.gray03,
                        image: AppString.arrowUp,
                        onPressed: _pickImage,
                      ),
                    ],
                  ),
                  AppSize.sv_20,
                  Expanded(
                    child: ValueListenableBuilder<List<File>>(
                      valueListenable: imagesNotifier,
                      builder: (context, images, _) {
                        if (images.isNotEmpty) {
                          return BuildGradViewComponent(galleryData: images);
                        } else {
                          return const Center(
                            child: Text('No images yet'),
                          );
                        }
                      },
                    ),
                  ),
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
      color: AppColor.gray03,
      image: AppString.arrowUp,
      onPressed: () {
        // Just show the upload dialog without network
        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) => const ShowAlertDialog(),
        );
      },
    );
  }
}
