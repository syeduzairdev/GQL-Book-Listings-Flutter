import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/screens/books_listing.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'provider/books_provider.dart';

main() async {
  await initHiveForFlutter(); // this is called so that Hive database is created and initialized to be used by flutter

  runApp(
    // we have set Change Notifier Provider in top of the widget tree
    ChangeNotifierProvider(
      // create call will invoke the constructor of the provider class
      create: (context) => BooksProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BooksListing(),
    );
  }
}
