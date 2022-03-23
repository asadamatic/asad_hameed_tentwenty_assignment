import 'package:flutter/material.dart';
import 'package:movie_app/src/style/style.dart';


class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              AppBar(
                backgroundColor: AppStyles.appbarBackgroundColor,
                automaticallyImplyLeading: true,
                foregroundColor: AppStyles.appBarTextColor,
                title: Container(alignment: Alignment.bottomLeft,child: const Text('3 Results Found')),
              ),
            ],
          ),
        ),
        body: const Center(),
      ),
    );
  }
}
