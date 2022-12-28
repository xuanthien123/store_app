import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import '../../model/detailProduct_Model.dart';
class TestMe extends StatefulWidget {
  const TestMe({super.key, required this.data});
  final List<CommentRate> data;
  @override
  _TestMeState createState() => _TestMeState();

}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  Widget commentChild(  List<CommentRate> data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.

                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                 /* child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i].)),*/
                ),
              ),
              title: Text(
                data[i].IDUser.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i].Content.toString()),
              trailing: Text(data[i].CommentDate.toString(), style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/img/userpic.jpg"),
          child: commentChild(widget.data),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {

              setState(() {
                var value = {
                  'IDComment': '1check',
                  'IDProduct':'15'
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00'
                };
              //  widget.data.add(CommentRate());
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {

            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}