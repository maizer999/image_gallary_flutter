import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/screen_config.dart';
import '../../add_item_form/add_item_form.dart';
import '../providers/item_provider.dart';
import '../service/add_item_service.dart';
import 'gallery/build_gradiView.dart';
import 'gallery/general_button.dart';
import 'gallery/show_alert_dialog.dart';

final addItemServiceProvider = Provider<AddItemService>((ref) => AddItemService());

final itemRepositoryProvider = Provider.autoDispose<ItemRepository>((ref) {
  final service = ref.read(addItemServiceProvider);
  return ItemRepository(service);
});

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

  // Submit images using repository
  Future<void> _submitImages(WidgetRef ref) async {
    if (imagesNotifier.value.isEmpty) {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(content: Text("Please select at least one image")),
      );
      return;
    }

    late BuildContext dialogContext;

    // Show uploading dialog
    // showDialog(
    //   context: ref.context,
    //   barrierColor: Colors.transparent,
    //   builder: (context) {
    //     dialogContext = context;
    //     return const ShowAlertDialog();
    //   },
    // );

    try {
      final result = await ref.read(itemRepositoryProvider).addItem(
        name: "Test",
        description: "Test",
        categoryId: "2",
        price: "1",
        contact: "0798286811",
        videoLink: "",
        allCategoryIds: "2",
        address: "Bhuj, Gujarat, India",
        latitude: "23.232639",
        longitude: "69.6415341",
        country: "Jordan",
        city: "Amman",
        state: "جاردنز",
        showOnlyToPremium: "1",
        galleryImages: imagesNotifier.value,
      );


      // Navigator.of(dialogContext).pop();

      result.when(
            (response) {
          ScaffoldMessenger.of(ref.context).showSnackBar(
            SnackBar(content: Text(response.message ?? "Uploaded successfully")),
          );
          imagesNotifier.value = []; // clear images

          // Navigate to AddItemFormScreen after success
          Navigator.of(ref.context).push(
            MaterialPageRoute(
              builder: (context) => const AddItemFormScreen(),
            ),
          );
        },
            (error) {

              Navigator.of(ref.context).push(
                MaterialPageRoute(
                  builder: (context) => const AddItemFormScreen(),
                ),
              );
          ScaffoldMessenger.of(ref.context).showSnackBar(

            SnackBar(content: Text(error.toString())),
          );
        },
      );

    } catch (e) {
     // Navigator.of(dialogContext).pop();
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(content: Text("Upload failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
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

                  // Submit button
                  GeneralButtonComponent(
                    text: 'submit',
                    image: AppString.arrowUp,
                    onPressed: () => _submitImages(ref),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      // Fixed bottom upload button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: GeneralButtonComponent(
          text: 'upload',
          image: AppString.arrowUp,
          onPressed: _pickImage,
        ),
      ),
    );
  }
}
