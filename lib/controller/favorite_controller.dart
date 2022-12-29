import 'package:get/get.dart';
import 'package:resimvideoplayer/main.dart';

class  favoriteController extends GetxController{
List<dynamic> Fav = [];

List <dynamic> FavDB = [].obs; 
 

DeleteFav(index){
FavDB.remove(FavDB[index]);
  update();
}

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