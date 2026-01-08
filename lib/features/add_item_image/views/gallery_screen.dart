import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/screen_config.dart';
import '../../add_item_form/add_item_form.dart';
import 'gallery/build_gradiView.dart';
import 'gallery/general_button.dart';

class GalleryScreen extends ConsumerWidget {
  GalleryScreen({super.key});

  final ValueNotifier<List<File>> imagesNotifier = ValueNotifier([]);

  // Pick multiple images
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      imagesNotifier.value = [
        ...imagesNotifier.value,
        ...pickedFiles.map((x) => File(x.path)),
      ];
    }
  }

  // Navigate to form screen with selected images
  void _goToFormScreen(BuildContext context) {
    if (imagesNotifier.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one image")),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddItemFormScreen(images: imagesNotifier.value),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.sv_30,

              // Main image preview
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

              // Image grid
              Expanded(
                child: ValueListenableBuilder<List<File>>(
                  valueListenable: imagesNotifier,
                  builder: (context, images, _) {
                    if (images.isEmpty) return const Center(child: Text('No images yet'));

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

              const SizedBox(height: 20),

              // Next button to form screen
              GeneralButtonComponent(
                text: 'Next',
                image: AppString.arrowUp,
                onPressed: () => _goToFormScreen(context),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // Bottom pick image button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: GeneralButtonComponent(
          text: 'Upload',
          image: AppString.arrowUp,
          onPressed: _pickImage,
        ),
      ),
    );
  }
}
