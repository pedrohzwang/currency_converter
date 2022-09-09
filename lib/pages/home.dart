import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void sendRequest() async {
  Uri url = Uri(host: 'https://api.hgbrasil.com/finance?format=json&key=9c5d7064');
  HttpClientRequest req = await HttpClient().getUrl(url);
  HttpClientResponse response = await req.close();
  // final String = await response.;
  
}