

import '../../main.dart';
import '../Splash/splash.dart';
import 'favorite_screen.dart';

class Favoritesfunctions {
  addtoFav(
    path,
  ) {
// log('message');
    if (FavDB.contains(path)) {
      return null;
    } else {
      Fav = FavDB;

      Fav.add(path);
      box.put('MyFavVideo', Fav);
    }
  }
}
