
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_gallery_app_using_rest_api/Models/user_model.dart';

class DataCalling{

  static List<UserModel> userData =[];

  static Future<List<UserModel>> getData()async{

    try{

      final request = http.Request("GET",Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      http.StreamedResponse response = await request.send();

      if(response.statusCode == 200){
        final rawData = await response.stream.bytesToString();

        List<dynamic> data = jsonDecode(rawData);
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userData.add(userModel);
        });
        return userData;
      }else{
        return [];
      }

    }catch(e){
      throw e;
    }


  }
}
