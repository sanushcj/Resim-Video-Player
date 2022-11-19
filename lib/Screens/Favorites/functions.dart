import 'dart:developer';

import '../../main.dart';
import '../Splash/splash.dart';
import 'favorite_screen.dart';

class Favoritesfunctions {
  addtoFav(
    path,
  ) {
    log('$path');
// log('message');
    if (FavDB.contains(path)) {
      log('message hai');
      return null;
    } else {
      Fav = FavDB;
      log('messageword');
      Fav.add(path);
      box.put('MyFavVideo', Fav);
      // log('${path}');
    }
  }




  
}