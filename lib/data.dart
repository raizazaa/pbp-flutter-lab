import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar : AppBar(
                title: Text('Budget Info'),
            ),
            drawer: DrawerWidget(),
            body: Center(                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                        for (var item in listModel)
                            Card(
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget> [
                                        ListTile(
                                            title: Text(item.title),
                                            subtitle: Text(item.date),
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget> [
                                                Padding(
                                                    padding: EdgeInsets.only(left: 15, bottom: 15),
                                                    child: Text(
                                                        "\$" + "${item.amount}"
                                                    ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(right: 15, bottom: 15),
                                                    child: Text(
                                                        item.type),
                                                ),
                                            ]
                                        )
                                    ]
                                )
                            )
                    ]
                )
            )
        );
    }
}

    