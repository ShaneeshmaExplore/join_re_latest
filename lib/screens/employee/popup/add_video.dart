import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/add_video_widgets.dart';
import 'package:join_re/utils/api.dart';
import 'package:video_player/video_player.dart';

class AddVideo extends StatefulWidget {
  final int id;
  const AddVideo({Key? key,  required this.id,}) : super(key: key);
  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late List data;
  List imagesUrl = [];
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    fetchDataFromApi();
  }
  Future fetchDataFromApi() async {
    var user_data ={"user_id":widget.id,"image_video":"video"};
    var res = await Network().authData(user_data, '/list_image_video');
    var body = json.decode(res.body);
    if(body['success']) {

      setState(() {
        data = body['gallery'];
        data.forEach((element) {
          imagesUrl.add(element['path']);
        });
      });
      return "Success";
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10.0),
      title: Row(
        children: [
          const Expanded(
              child: Text(
                'Upload to Gallery',
                textAlign:
                TextAlign.center,
                style: TextStyle(
                    color: Color
                        .fromRGBO(58,
                        54, 115, 1),
                    fontFamily:
                    'Open Sans',
                    fontSize: 14,
                    letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight:
                    FontWeight
                        .bold,
                    height: 1.25),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(
                    context)
                    .pop();
              },
              child: Container(
                alignment: Alignment.topRight,
                width: 20,
                height: 20,
                decoration:
                const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Close.png'),
                      fit: BoxFit
                          .fitHeight),
                ),
              ))
        ],
      ),
      content: SingleChildScrollView(child: Container(
        // Specify some width
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .55,
        child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: imagesUrl.length +1,
          itemBuilder: (BuildContext context, int index) {
            if(index == imagesUrl.length)
              return Row(children:[const SizedBox(
                  width: 10),Container(
                  width: 91,
                  height: 79,
                  decoration:
                  BoxDecoration(
                    borderRadius:
                    const BorderRadius
                        .only(
                      topLeft: Radius
                          .circular(
                          5),
                      topRight: Radius
                          .circular(
                          5),
                      bottomLeft: Radius
                          .circular(
                          5),
                      bottomRight:
                      Radius
                          .circular(
                          5),
                    ),
                    border:
                    Border.all(
                      color: const Color
                          .fromRGBO(
                          58,
                          54,
                          115,
                          1),
                      width: 1,
                    ),
                  ), child: GestureDetector(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddVideoWidgets(id:widget.id);
                        });
                  },
                  child:Container(
                      width: 48,
                      height: 48,
                      decoration:
                      const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Video.png'),
                            fit: BoxFit
                                .none),
                      )))), const SizedBox(
                width: 10,
              ),]);
            else
              return Row(
                  children:[const SizedBox(
                      width: 10),
                    Container(
                      width: 91,
                      height: 79,
                      decoration:
                      BoxDecoration(
                        borderRadius:
                        const BorderRadius
                            .only(
                          topLeft: Radius
                              .circular(
                              5),
                          topRight: Radius
                              .circular(
                              5),
                          bottomLeft: Radius
                              .circular(
                              5),
                          bottomRight:
                          Radius
                              .circular(
                              5),
                        ),
                        border:
                        Border.all(
                          color: const Color
                              .fromRGBO(
                              58,
                              54,
                              115,
                              1),
                          width: 1,
                        ),
                      ), child:
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        _controller = VideoPlayerController.network(imagesUrl[index]);
                        return Center(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  // VideoPlayerController.network(imagesUrl[index])
                      ),
                    const SizedBox(
                      width: 10,
                    ),]);
          },
        ),
      )),

    );
  }
}
