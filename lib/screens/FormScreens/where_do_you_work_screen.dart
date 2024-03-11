import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkPlaceScreen extends StatefulWidget {
  const WorkPlaceScreen({super.key});

  @override
  State<WorkPlaceScreen> createState() => _WorkPlaceScreenState();
}

class _WorkPlaceScreenState extends State<WorkPlaceScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerCollege = TextEditingController();
  final List<String> _allItems = [
    'Apple',
    'TCS',
    'Accenture',
    'Congnizent',
    'Google',
    'Microsoft',
    'Amdocs'
  ];
  List<String> _suggestions = [];

  void _search(String query) {
    List<String> matchingItems = [];
    if (query.isNotEmpty) {
      matchingItems.addAll(
        _allItems.where(
          (item) => item.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    setState(() => _suggestions = matchingItems);
  }

  final List<String> _allItemsCollege = [
    "Greenfield Academy",
    "Rivertown College",
    "Hilltop University",
    "Sunnyvale High School",
    "Silver Oak Institute",
    "Harborview College",
    "Maplewood Technical School",
    "Crestview Community College",
    "Blue Mountain University",
    "Starlight Conservatory",
  ];

  List<String> _suggestionsCollege = [];

  void _searchCollege(String query) {
    List<String> matchingItems = [];
    if (query.isNotEmpty) {
      matchingItems.addAll(
        _allItemsCollege.where(
          (item) => item.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    setState(() => _suggestionsCollege = matchingItems);
  }

  void _onSuggestionTap(String suggestion) {
    setState(() {
      _controller.text = suggestion; // Set the text of the TextField
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: suggestion.length),
      );
      _suggestionsCollege = []; // Clear the suggestions
    });
  }

  void _onSuggestionTapCollege(String suggestion) {
    setState(() {
      _controllerCollege.text = suggestion; // Set the text of the TextField
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: suggestion.length),
      );
      _suggestions = []; // Clear the suggestions
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Text(
              'Where do you work?',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: _search,
              controller: _controller,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.work,
                  color: Colors.white,
                ),
                floatingLabelStyle:
                    TextStyle(fontSize: 22, color: Colors.white),
                labelStyle: TextStyle(fontSize: 22, color: Colors.white),
                hintText: 'search name',
                hintStyle: TextStyle(fontSize: 22, color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _suggestions[index],
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () => _onSuggestionTap(
                      _suggestions[index]), // Fill TextField on tap
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(
                    color: Colors.white54,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 5,
                  ),
                ),
                Text('Or', style: TextStyle(color: Colors.white)),
                Flexible(
                  child: Divider(
                    color: Colors.white54,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 50,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Your College or school?',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: _searchCollege,
              controller: _controllerCollege,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.school,
                  color: Colors.white,
                ),
                floatingLabelStyle:
                    TextStyle(fontSize: 22, color: Colors.white),
                labelStyle: TextStyle(fontSize: 22, color: Colors.white),
                hintText: 'search name',
                hintStyle: TextStyle(fontSize: 22, color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestionsCollege.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _suggestionsCollege[index],
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () =>
                      _onSuggestionTapCollege(_suggestionsCollege[index]),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
