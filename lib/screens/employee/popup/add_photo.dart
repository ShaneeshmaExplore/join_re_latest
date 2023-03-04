import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/add_photo_widgets.dart';
import 'package:join_re/utils/api.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



//import http package manually
class AddPhoto extends StatefulWidget {
  final int id;
  const AddPhoto({Key? key,  required this.id,}) : super(key: key);
// const EmployeeHome({super.key});
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {

  late List data;
  List imagesUrl = [];
  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }
  Future fetchDataFromApi() async {
    var user_data ={"user_id":widget.id,"image_video":"image"};
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
                                              return AddPhotoWidget(id:widget.id,profile_img:"false");
                                            });
                                      },
                                      child:Container(
                                width: 48,
                                height: 48,
                                decoration:
                                const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Addimage.png'),
                                      fit: BoxFit
                                          .none),
                                )))), const SizedBox(
                            width: 10,
                          ),]);
                        else
                        return Row(
                            children:[const SizedBox(
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
                        ), child:Image.network(
                          imagesUrl[index],
                          fit: BoxFit.fitHeight,
                        )),
                          const SizedBox(
                            width: 10,
                          ),]);
                      },
                    ),
      )),

    );
  }

}






