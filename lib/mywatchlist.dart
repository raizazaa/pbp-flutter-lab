import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/fetchwatchlist.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/watchlistdata.dart';

class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({super.key});

    @override
    State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watch List')
            ),
            drawer: DrawerWidget(
            ),
            body: FutureBuilder(
                future: fetchWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                            return Column(
                                children: const [
                                    Text(
                                        "Watch list is empty :(",
                                        style: TextStyle(
                                            color: Color(0xff59A5D8),
                                            fontSize: 20),
                                    ),
                                    SizedBox(height: 8),
                                ],
                            );
                        } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index)=> GestureDetector(
                                    onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => WatchListData(
                                                        data: snapshot.data![index],
                                                    )
                                                )
                                            );
                                        },
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(15.0),
                                            boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 2.0
                                                )
                                            ]
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                CheckboxListTile(
                                                    title: Text(
                                                        "${snapshot.data![index].fields.itemTitle}",
                                                        style: TextStyle(fontSize: 14)),
                                                    value: snapshot.data![index].fields.itemWatched,
                                                    onChanged: (bool? value) {
                                                        setState(() {
                                                            snapshot.data![index].fields.itemWatched = value!;
                                                        });
                                                    },
                                                ),
                                            ],
                                        )
                                    ),
                                )
                            );
                        }
                    }
                }
            )
        );
    }
}