import 'package:app/ui/widgets/search-results-list-view.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPage extends StatelessWidget {
  //final _serachBarController = TextEditingController();
  const SearchPage({Key? key,
    required this.onChanged,
    required this.hint,
    required this.errorMessage,
    required this.searchController,
  }) : super(key: key);
  final TextEditingController searchController;
  final String hint;
  //final Stream<String> items;
  final Function(String?) onChanged;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    List<String> data = List<String>.empty();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    print("Searchpage: ${data}");
    return FloatingSearchBar(
      hint: hint,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        print("something here 36");
        data = this.onChanged(query);
        print(data);
        print("query changed!");
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
        builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               SearchResults(data)
              ],
              // children: Colors.accents.map((color) {
              //   return Container(height: 112, color: color);
              // }).toList(),
            ),
          ),
        );
      },

    );

     



          // The search area here
      //   return  Container(
      //   width: double.infinity,
      //   height: 40,
      //   decoration: BoxDecoration(
      //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
      //   child: Center(
      //     child: TextField(
      //       onChanged: onChanged,
      //       controller: searchController,
      //       decoration: InputDecoration(
      //           prefixIcon: Icon(Icons.search),
      //           suffixIcon: IconButton(
      //             icon: Icon(Icons.clear),
      //             onPressed: () {
      //              // _serachBarController.clear();
      //               searchController.clear();
      //               /* Clear the search field */
      //             },
      //           ),
      //           hintText: hint,
      //           border: InputBorder.none),
      //     ),
      //   ),
      // );
 
  }
}
