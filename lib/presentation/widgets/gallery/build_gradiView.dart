import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/utils/app_string.dart';

class BuildGradViewComponent extends StatelessWidget {
  final List<File> galleryData;
  final void Function(int) onRemove; // callback for remove

  const BuildGradViewComponent({
    super.key,
    required this.galleryData,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: galleryData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            // Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                  image: galleryData[index].existsSync()
                      ? FileImage(galleryData[index])
                      :  AssetImage(AppString.image) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // X button
            Positioned(
              top: 2,
              right: 2,
              child: GestureDetector(
                onTap: () => onRemove(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
