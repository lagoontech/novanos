// To parse this JSON data, do
//
//     final leadSource = leadSourceFromJson(jsonString);

import 'dart:convert';

List<LeadSource> leadSourceFromJson(String str) =>
    List<LeadSource>.from(json.decode(str).map((x) => LeadSource.fromJson(x)));

String leadSourceToJson(List<LeadSource> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeadSource {
  LeadSource({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory LeadSource.fromJson(Map<String, dynamic> json) => LeadSource(
        id: json["Id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
