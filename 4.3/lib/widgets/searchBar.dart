import 'package:flutter/material.dart';
import '../models/chats.dart';

class SearchBar extends StatelessWidget {
  final List<Chats> searchableList;
  final Function(List<Chats>) callback;

  const SearchBar({
    super.key,
    required this.searchableList,
    required this.callback,
  });

  void _filterList(String value) {
    List<Chats> resultList = searchableList
        .where((chats) =>
        chats.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    callback(resultList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: TextField(
        onChanged: (value) => _filterList(value),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: 'Search chats',
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
