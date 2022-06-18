import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constant/sized_box.dart';

class Drawers extends StatefulWidget {
  final Function callback;

  const Drawers({Key? key, required this.callback}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('Damodar'),
                accountEmail: Text('darsh@gmail.com')),

            ListTile(
              leading: const Icon(Icons.add),
              title: TextButton(
                onPressed: () {
                  widget.callback(MapType.normal);
                  Navigator.of(context).pop();
                },
                child: const Text('Normal Mode'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: TextButton(
                onPressed: () {
                  widget.callback(MapType.satellite);
                  Navigator.of(context).pop();
                },
                child: const Text('Satellite Mode'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: TextButton(
                onPressed: () {
                  widget.callback(MapType.hybrid);
                  Navigator.of(context).pop();
                },
                child: const Text('Hybrid Mode'),
              ),
            ),
          ],
        ));
  }
}
