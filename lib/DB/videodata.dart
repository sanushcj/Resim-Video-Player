

class VideoListData {
  VideoListData(
      {this.size,
      this.duration,
      this.folderName,
      this.id,
      this.path,
      this.title,});

  VideoListData.fromJson(Map<String, dynamic> json) {
    size = json['Size'] as String;
    duration = json['duration'] as int;
    folderName = json['folderName'] as String;
    id = json['id'] as String;
    path = json['path'] as String;
    title = json['title'] as String;
    //  print("folderName");
  }
  String? size;
  int? duration;
  String? folderName;
  String? id;
  String? path;
  String? title;

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['Size'] = size;
  //   data['duration'] = duration;
  //   data['folderName'] = folderName;
  //   data['id'] = id;
  //   data['path'] = path;
  //   data['title'] = title;
   
  //   return data;
  // }
}
