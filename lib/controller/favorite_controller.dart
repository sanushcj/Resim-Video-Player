import 'package:get/get.dart';
import 'package:resimvideoplayer/Screens/Splash/splash.dart';
import 'package:resimvideoplayer/main.dart';

class  favoriteController extends GetxController{
List<dynamic> Fav = [];

List <dynamic> FavDB = FavDB[].obs
 
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