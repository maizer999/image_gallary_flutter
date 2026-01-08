import 'package:flutter/material.dart';
import '../../features/add_item_image/views/gallery_screen.dart';

class Routers {
  static const String loginScreen = '/login';
  static const String galleryScreen = '/gallery_screen';
}

class RoutersGenerated {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routers.galleryScreen:
        return MaterialPageRoute(builder: (_) =>  GalleryScreen());
      default:
        return MaterialPageRoute(builder: (_) => GalleryScreen());
    }
  }
}
