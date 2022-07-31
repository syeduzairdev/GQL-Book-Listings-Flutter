import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/services/graphql_service/books_gql_service.dart';

class EditBooks extends StatefulWidget {
  const EditBooks({Key? key}) : super(key: key);

  @override
  State<EditBooks> createState() => _EditBooksState();
}

class _EditBooksState extends State<EditBooks> {
  BooksGQLService _booksGQLService = BooksGQLService(
      Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));
  bool _loading = false;
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _id = TextEditingController();
  final TextEditingController _isbn = TextEditingController();
  final TextEditingController _title = TextEditingController();

  final TextEditingController _author_id = TextEditingController();
  final TextEditingController _thumbnail = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _id.dispose();
    _isbn.dispose();
    _title.dispose();
    _author_id.dispose();
    _thumbnail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Books'),
        centerTitle: true,
        // backgroundColor: Colors.,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Center(
            child: Text(
              'Update the books Record',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _id,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(13),
              fillColor: Color(0xffF4F5F7),
              hintText: 'id',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _isbn,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(13),
              fillColor: Color(0xffF4F5F7),
              hintText: 'isbn',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _title,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(13),
              fillColor: Color(0xffF4F5F7),
              hintText: 'title',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _author_id,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(13),
              fillColor: Color(0xffF4F5F7),
              hintText: 'author_id',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _thumbnail,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(13),
              fillColor: Color(0xffF4F5F7),
              hintText: 'thumbnail',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _loading = true;
              _booksGQLService.updateBook(
                  int.parse(_id.text.toString()),
                  _isbn.text,
                  _title.text,
                  int.parse(_author_id.text.toString()),
                  _thumbnail.text); // pass your controller variables here
              _loading = false;
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Color(0xff5449F8),
              minimumSize: Size(MediaQuery.of(context).size.width, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(
              'Update',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
