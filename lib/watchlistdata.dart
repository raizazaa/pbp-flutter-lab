import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/mywatchlist.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/drawer.dart';
import 'package:intl/intl.dart';

class WatchListData extends StatefulWidget {
    const WatchListData({super.key, required this.data});
    final WatchList data;

    @override
    State<WatchListData> createState() => _WatchListDataState();
}

class _WatchListDataState extends State<WatchListData> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Details')
            ),
            drawer: DrawerWidget(
            ),
            body: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children: [
                        Center(
                            child: Text(
                                widget.data.fields.itemTitle,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                            )
                        ),
                        SizedBox(height: 12),
                        Row(
                            children: [
                                Text(
                                    "Release Date: ", style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    DateFormat.yMMMd().format(widget.data.fields.itemReleaseDate)
                                )
                            ]
                        ),
                        SizedBox(height: 8),
                        Row(
                            children: [
                                Text(
                                    "Rating: ", style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    "${widget.data.fields.itemRating}/5"
                                )
                            ]
                        ),
                        SizedBox(height: 8),
                        Row(
                            children: [
                                Text(
                                    "Status: ", style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    widget.data.fields.itemWatched ? "Watched" : "Not Watched"
                                )
                            ]
                        ),
                        SizedBox(height: 8),
                        Row(
                            children: [Text(
                            "Review: ", style: TextStyle(fontWeight: FontWeight.bold)
                            )],    
                        ),
                        Row(
                            children: [Flexible(
                            child: Text(widget.data.fields.itemReview)
                            )],
                        )
                    ]
                )
            ),
            floatingActionButton: Center(
                child: TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    child: const Text("BACK", style: TextStyle(color: Colors.white))
                )
            )
        );
    }
}