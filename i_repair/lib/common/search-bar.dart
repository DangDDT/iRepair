import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Container(
            width: 340,
            padding: EdgeInsets.only(top: 20, right: 10),
            margin: EdgeInsets.only(left: 10),
            child: SearchField(
              controller: _searchController,
              suggestionState: SuggestionState.hidden,
              hint: 'What is the service you want ?',
              suggestions: [
                'Sửa ống nước',
                'Vá lốp bánh xe',
                'Thay dầu',
                'Thay ống đồng máy lạnh',
                'Làm vườn',
                'Dọn dẹp vệ sinh nhà cửa',
                'Thay màn hình điện thoại',
                'Thay SSD laptop'
              ],
              hasOverlay: true,
              maxSuggestionsInViewPort: 5,
              marginColor: Colors.black45,
              suggestionStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              searchStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              itemHeight: 50,
              suggestionsDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200],
              ),
              searchInputDecoration: InputDecoration(
                filled: true,
                fillColor: Color(0XffCCC5B9),
                contentPadding: EdgeInsets.only(top: 15, bottom: 10, left: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(34.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(34.0)),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black45,
                  size: 20,
                ),
              ),
            ),
          ),
          Container(
              width: 50,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(34.0),
                        ),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xffC4C4C4).withOpacity(0.82))),
                  child: Image.asset(
                    ("assets/images/personal-icon.png"),
                    height: 50,
                  ))),
        ],
      ),
    );
  }
}
