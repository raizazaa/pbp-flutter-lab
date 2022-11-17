import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';

class DrawerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: Column(
                children: [
                // Adding clickable menu
                    ListTile(
                        title: const Text('counter_7'),
                        onTap: () {
                        // Routing the menu to the main page
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Counter Program')),
                            );
                        },
                    ),
                    ListTile(
                        title: const Text('Add Budget Info'),
                        onTap: () {
                            // Routing the menu to the form page
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MyFormPage()),
                            );
                        },
                    ),
                    ListTile(
                        title: const Text('Budget Data'),
                        onTap: () {
                            // Routing the menu to the form page
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MyDataPage()),
                            );
                        },
                    ),
                ],
            ),
        );
    }
}