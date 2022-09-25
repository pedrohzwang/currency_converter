import 'package:currency_converter/pages/currency_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'R\$'),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            //   child: TextField(
            //     autofocus: true,
            //     decoration: InputDecoration(labelText: 'R\$'),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            //   child: TextField(
            //     autofocus: true,
            //     decoration: InputDecoration(labelText: 'R\$'),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            //   child: TextField(
            //     autofocus: true,
            //     decoration: InputDecoration(labelText: 'R\$'),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            //   child: TextField(
            //     autofocus: true,
            //     decoration: InputDecoration(labelText: 'R\$'),
            //   ),
            // ),
            SizedBox(
              height: 500,
              child: CurrencyForm(),
            )
          ],
        ),
      ),
    );
  }
}
