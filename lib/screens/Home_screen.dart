
import 'package:flutter/material.dart';
import 'package:photo_gallery_app_using_rest_api/Data_calling/data_calling.dart';
import 'package:photo_gallery_app_using_rest_api/Models/user_model.dart';
import 'package:photo_gallery_app_using_rest_api/screens/photo_details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<UserModel>> _futurePhotos;

  @override
  void initState() {
    _futurePhotos = DataCalling.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Photo Gallery App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: _futurePhotos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No photos found'));
              } else {
                List<UserModel> photos = snapshot.data!;
                return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:const EdgeInsets.symmetric(vertical: 5.0),
                      leading: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoDetailsScreen(photo: photos[index])));
                          },
                          child: Image.network(photos[index].thumbnailUrl.toString()
                          )
                      ),
                      title: Wrap(
                        children: [
                          Text(photos[index].title.toString()),
                        ],
                      ),
                    );
                  },
                );
              }
            }
        ),
      ),
    );
  }
}
