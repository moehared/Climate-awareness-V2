import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/search-results-list-view.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPage extends StatelessWidget {
  //final _serachBarController = TextEditingController();
   SearchPage({
    Key? key,
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
  final controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    debugPrint("search controller -> ${controller.query}");
    List<UserModel> data = [];
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    print("Searchpage: ${data}");
    return FloatingSearchBar(
      hint: hint,
      controller: controller,
      automaticallyImplyBackButton: false,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) async {
  
        print("something here 36");
        data = await this.onChanged(query);
        print("this is some data ${data}");
        locator<ChatDatabaseService>().setSearchUserListResults(data);
        // SearchResults(data);
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
        print("searach bar widget line 63");
         
        // if (data.isEmpty) return Container();
         //return Visibility(
          // visible: data.isNotEmpty,
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  SearchResults(
                      locator<ChatDatabaseService>().getSearchUserListResults()),
                  //Text("is there something here"),
                ],
              ),
            ),
                 );
        // );
      },
    );
  }
}

// profile image (place holder) usee name 
// message 
