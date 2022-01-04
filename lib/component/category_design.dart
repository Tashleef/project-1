import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final category;
  final select;
  CategoriesList({this.category, this.select});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: select,
                      blurRadius: 5
                  )
                ],
                border: Border.all(color: select,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}