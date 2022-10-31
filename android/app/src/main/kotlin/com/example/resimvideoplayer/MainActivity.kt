package com.example.resimvideoplayer
import android.Manifest
import android.annotation.SuppressLint
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.util.Log
import androidx.annotation.RequiresApi
// import com.example.videoss_sample.VideoListDetails
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.*
import kotlin.collections.ArrayList

private const val CHANNEL = "search_files_in_storage/search"

class MainActivity : FlutterActivity() {

        private val requestCode = 100

        @SuppressLint("NewApi")
        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
                super.configureFlutterEngine(flutterEngine)
                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                                .setMethodCallHandler { call, result ->
                                        if (call.method == "search") {
                                                var _result = requestPermissionAndListFiles()
                                                if (!_result) {
                                                        result.error(
                                                                        "401",
                                                                        "No READ_EXTERNAL_STORAGE permission",
                                                                        ""
                                                        )
                                                        return@setMethodCallHandler
                                                } else {
                                                        Log.i(
                                                                        "FILE_CHECKING",
                                                                        "Searching for " +
                                                                                        call.arguments
                                                        )
                                                        var _r = getAllVideo()
                                                        if (_r == null) {
                                                                result.error(
                                                                                "404",
                                                                                "FAILED if (Environment.MEDIA_MOUNTED == state || Environment.MEDIA_MOUNTED_READ_ONLY == state)",
                                                                                ""
                                                                )
                                                                return@setMethodCallHandler
                                                        } else {
                                                                result.success(_r)
                                                        }
                                                }
                                        }
                                }
        }

        private fun requestPermissionAndListFiles(): Boolean {
                Log.e("PERMISSION", "getting permission status")
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M &&
                                                checkSelfPermission(
                                                                Manifest.permission
                                                                                .READ_EXTERNAL_STORAGE
                                                ) != PackageManager.PERMISSION_GRANTED
                ) {
                       
                        return false
                } else {
                        return true
                }
        }

        @SuppressLint("Recycle", "Range")
        @RequiresApi(Build.VERSION_CODES.R)
        private fun getAllVideo(): String {
                val templistclass = ArrayList<VideoListDetails>()
              
                // val selection = MediaStore.Video.Media.TITLE + "DESC"
                val projection =
                                arrayOf( MediaStore.Video.Media.TITLE,
                                    MediaStore.Video.Media.SIZE,
                                    MediaStore.Video.Media._ID,
                                    MediaStore.Video.Media.BUCKET_DISPLAY_NAME,
                                    MediaStore.Video.Media.DATA,
                                    MediaStore.Video.Media.DATE_ADDED,
                                    MediaStore.Video.Media.DURATION)


                val cursor =
                this.contentResolver.query(
                        MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                        projection,
                        null,
                        null,
                        MediaStore.Video.Media.DATE_ADDED + " DESC",
                       
        )
                if (cursor != null) {
                        if (cursor.moveToFirst())       
                                        do {
                                            val titleC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media.TITLE))
                                            val idC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media._ID))
                                            val folderC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media.BUCKET_DISPLAY_NAME))
                                            val sizeC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media.SIZE))
                                            val pathC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media.DATA))
                                            val durationC = cursor.getString(cursor.getColumnIndex(MediaStore.Video.Media.DURATION)).toLong()
//
                                            try {

                                                val  file = File(pathC)
                                                

                                                val videoss = VideoListDetails(title=titleC, id = idC , folderName = folderC, Size = sizeC, path = pathC, duration = durationC,)
                                                if (file.exists()) templistclass.add(videoss) }catch (e:java.lang.Exception){}
                                        }while (cursor.moveToNext())
                    cursor?.close()



                                              


                     



                      
                }
               
              

             
                val gson = Gson()
                val gsonPretty = GsonBuilder().setPrettyPrinting().create()
                val tut = templistclass
                val jsonTut: String = gson.toJson(tut)
               

                return jsonTut


        }
}