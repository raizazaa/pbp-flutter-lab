// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);

import 'dart:convert';

List<WatchList> watchListFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
    WatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.itemWatched,
        required this.itemTitle,
        required this.itemRating,
        required this.itemReleaseDate,
        required this.itemReview,
    });

    bool itemWatched;
    String itemTitle;
    int itemRating;
    DateTime itemReleaseDate;
    String itemReview;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        itemWatched: json["item_watched"],
        itemTitle: json["item_title"],
        itemRating: json["item_rating"],
        itemReleaseDate: DateTime.parse(json["item_release_date"]),
        itemReview: json["item_review"],
    );

    Map<String, dynamic> toJson() => {
        "item_watched": itemWatched,
        "item_title": itemTitle,
        "item_rating": itemRating,
        "item_release_date": "${itemReleaseDate.year.toString().padLeft(4, '0')}-${itemReleaseDate.month.toString().padLeft(2, '0')}-${itemReleaseDate.day.toString().padLeft(2, '0')}",
        "item_review": itemReview,
    };
}

enum Model { MYWATCHLIST_ITEMMYWATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.itemmywatchlist": Model.MYWATCHLIST_ITEMMYWATCHLIST
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap = {};

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
