import 'package:flutter/material.dart';

class SportsListTiles extends StatefulWidget {

  @override
  State<SportsListTiles> createState() => _SportsListTilesState();
}

class _SportsListTilesState extends State<SportsListTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Container()
            )
          ),
          FloatingActionButton(
            elevation: 12,
            child: const Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'Ficha');
            },
          )
        ],
      ),
    );
  }
}