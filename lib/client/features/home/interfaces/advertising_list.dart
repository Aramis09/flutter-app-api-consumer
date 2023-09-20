class AdvertisingInterface {
  String? message;
  int status;
  bool succes;
  List<AdvertisingDetail> data;

  AdvertisingInterface({
    required this.message,
    required this.status,
    required this.succes,
    required this.data,
  });

  factory AdvertisingInterface.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonData = json["data"];
    List<AdvertisingDetail> mappedData =
        jsonData.map((data) => AdvertisingDetail.fromJson(data)).toList();

    return AdvertisingInterface(
        message: json["message"],
        status: json["status"],
        succes: json["succes"],
        data: mappedData);
  }
}

class AdvertisingDetail {
  int id;
  String title;
  String summary;
  String aside;
  String footer;
  String image;
  String date;
  String createdAt;
  String updatedAt;
  List<SectionsView> sectionsViews;

  AdvertisingDetail({
    required this.id,
    required this.title,
    required this.summary,
    required this.aside,
    required this.footer,
    required this.image,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.sectionsViews,
  });

  factory AdvertisingDetail.fromJson(Map<dynamic, dynamic> details) {
    List<dynamic> sectionsViews = details["SectionsViews"];
    List<SectionsView> mappedSectionsViews = sectionsViews
        .map(
          (section) => SectionsView.fromJson(section),
        )
        .toList();
    return AdvertisingDetail(
      id: details["id"],
      title: details["title"],
      summary: details["summary"],
      aside: details["aside"],
      footer: details["footer"],
      image: details["image"],
      date: details["date"],
      createdAt: details["createdAt"],
      updatedAt: details["updatedAt"],
      sectionsViews: mappedSectionsViews,
    );
  }
}

class SectionsView {
  int id;
  String title;
  String? textPartOne;
  String? textPartTwo;
  String? topImage;
  String? middleImage;
  String? belowImage;
  String createdAt;
  String updatedAt;
  int setAdvertisingOwner;
  dynamic setServiceOwners;
  dynamic setSubServiceOwner;

  SectionsView({
    required this.id,
    required this.title,
    required this.textPartOne,
    required this.textPartTwo,
    required this.topImage,
    required this.middleImage,
    required this.belowImage,
    required this.createdAt,
    required this.updatedAt,
    required this.setAdvertisingOwner,
    required this.setServiceOwners,
    required this.setSubServiceOwner,
  });
  factory SectionsView.fromJson(Map<dynamic, dynamic> json) {
    return SectionsView(
        id: json["id"],
        title: json["title"],
        textPartOne: json["textPartOne"],
        textPartTwo: json["textPartTwo"],
        topImage: json["topImage"],
        middleImage: json["middleImage"],
        belowImage: json["belowImage"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        setAdvertisingOwner: json["setAdvertisingOwner"],
        setServiceOwners: json["setServiceOwners"],
        setSubServiceOwner: json["setSubServiceOwner"]);
  }
}
