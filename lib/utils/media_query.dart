import 'package:flutter/cupertino.dart';

double screenheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenwidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
