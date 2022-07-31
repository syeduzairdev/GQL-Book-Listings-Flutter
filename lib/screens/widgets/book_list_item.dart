import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:gql_flutter_todo/provider/books_provider.dart';
import 'package:gql_flutter_todo/screens/Books/edit_books.dart';
import 'package:provider/provider.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  // constructor of this widget will be called with Book object as argument
  const BookListItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditBooks(),
              ),
            );
          }),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 220, 220),
              image: DecorationImage(
                  image: NetworkImage(book.thumbnail!), fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Book Title: " + book.title!),
            InkWell(
              onTap: (() {
                print("Delete action");
                Provider.of<BooksProvider>(context, listen: false)
                    .deleteBook(book);
              }),
              child: Icon(
                Icons.delete,
                size: 30,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text("Book isbn: " + book.isbn!),
        SizedBox(
          height: 30,
        ),
        
      ],
    );
  }
}
