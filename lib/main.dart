import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/graphql/queries/books/books_queries.dart';
import 'package:gql_flutter_todo/screens/books_listing.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

main() async {
  await initHiveForFlutter(); // this is called so that Hive database is created and initialized to be used by flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client:
          Config.initializeClient(AuthTokenRepository().getAuthToken().token),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_circle_right),
            onPressed: () {
              // navigate to books listing
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BooksListing(),
                ),
              );
            },
          ),
        ],
      ),
      body: Query(
        options: QueryOptions(
          document: gql(BookQueries.getBooksAll),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            // if there is error in response then show error
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            // if response is loading then show loading indicator
            return const Text('Loading');
          }

          // it can be either Map or List
          // List<Book> books = [];

          // var _listOfBooksJson = json.decode(result.data!['list']);

          // print("result data ${_listOfBooksJson}");

          // return SizedBox(
          //   child: Text("Data is loaded"),
          // );

          List booksList = result.data!['list'];
//         // print the response in ListView using ListView.builder
          return ListView.builder(
            itemCount: booksList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(booksList[index]['title']),
                subtitle: Text(booksList[index]['isbn']),
                trailing: CircleAvatar(
                  backgroundImage: NetworkImage(booksList[index]['thumbnail']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
