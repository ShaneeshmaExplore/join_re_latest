import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:join_re/models/post_model.dart';
import 'package:join_re/utils/api.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future:
          Network().getSampleData('https://jsonplaceholder.typicode.com/posts'),
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData) {
          List<PostModel> models = snapshot.data!;
          return ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) => Card(
                      child: ListTile(
                    title: Text(models[index].title!),
                    subtitle: Text(models[index].body!),
                  )));
        } else {
          return Text('loading..');
        }
      },
    ));
  }
}
