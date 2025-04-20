class LocationListModel {
  bool? status;
  String? message;
  Data? data;

  LocationListModel({this.status, this.message, this.data});

  LocationListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<LocationData>? nearby;
  List<LocationData>? popular;

  Data({this.nearby, this.popular});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['nearby'] != null) {
      nearby = <LocationData>[];
      json['nearby'].forEach((v) {
        nearby!.add(LocationData.fromJson(v));
      });
    }
    if (json['popular'] != null) {
      popular = <LocationData>[];
      json['popular'].forEach((v) {
        popular!.add(LocationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nearby != null) {
      data['nearby'] = nearby!.map((v) => v.toJson()).toList();
    }
    if (popular != null) {
      data['popular'] = popular!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationData {
  int? id;
  String? name;
  String? description;
  String? location;
  int? price;
  int? min;
  String? active;
  String? routeVideoId;
  String? language;
  String? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  double? averageRating;
  bool? isFavourite;
  Author? author;
  IdNameModel? travelmethod;
  List<Steps>? steps;
  List<IdNameModel>? categories;
  List<Images>? images;
  Audios? audio;

  LocationData(
      {this.id,
      this.name,
      this.description,
      this.location,
      this.price,
      this.min,
      this.active,
      this.routeVideoId,
      this.language,
      this.coverImage,
      this.stepcount,
      this.duration,
      this.distance,
      this.trashed,
      this.averageRating,
      this.isFavourite,
      this.author,
      this.travelmethod,
      this.steps,
      this.categories,
      this.images,
      this.audio});

  LocationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'];
    price = json['price'].toInt();
    min = json['min'];
    active = json['active'];
    routeVideoId = json['route_video_id'];
    language = json['language'];
    coverImage = json['cover_image'];
    stepcount = json['stepcount'];
    duration = json['duration'];
    distance = json['distance'];
    trashed = json['trashed'];
    averageRating = json['average_rating'].toDouble();
    isFavourite = json['is_favourite'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    travelmethod = json['travelmethod'] != null ? IdNameModel.fromJson(json['travelmethod']) : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <IdNameModel>[];
      json['categories'].forEach((v) {
        categories!.add(IdNameModel.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    audio = json['audio'] != null ? Audios.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['location'] = location;
    data['price'] = price;
    data['min'] = min;
    data['active'] = active;
    data['route_video_id'] = routeVideoId;
    data['language'] = language;
    data['cover_image'] = coverImage;
    data['stepcount'] = stepcount;
    data['duration'] = duration;
    data['distance'] = distance;
    data['trashed'] = trashed;
    data['average_rating'] = averageRating;
    data['is_favourite'] = isFavourite;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (travelmethod != null) {
      data['travelmethod'] = travelmethod!.toJson();
    }
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['audio'] = audio;
    return data;
  }
}

class Author {
  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? description;
  String? hobbies;
  String? job;
  String? imgPath;
  String? appleId;
  String? googleId;
  int? otp;
  String? otpExpiry;
  int? isVerified;
  String? active;
  String? stripeCustomerId;
  List<int>? routesStarredIds;
  Level? level;

  Author(
      {this.id,
      this.username,
      this.email,
      this.birthday,
      this.location,
      this.description,
      this.hobbies,
      this.job,
      this.imgPath,
      this.appleId,
      this.googleId,
      this.otp,
      this.otpExpiry,
      this.isVerified,
      this.active,
      this.stripeCustomerId,
      this.routesStarredIds,
      this.level});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    birthday = json['birthday'];
    location = json['location'];
    description = json['description'];
    hobbies = json['hobbies'];
    job = json['job'];
    imgPath = json['img_path'];
    appleId = json['apple_id'];
    googleId = json['google_id'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    isVerified = json['is_verified'];
    active = json['active'];
    stripeCustomerId = json['stripe_customer_id'];
    routesStarredIds = json['routes_starred_ids'].cast<int>();
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['birthday'] = birthday;
    data['location'] = location;
    data['description'] = description;
    data['hobbies'] = hobbies;
    data['job'] = job;
    data['img_path'] = imgPath;
    data['apple_id'] = appleId;
    data['google_id'] = googleId;
    data['otp'] = otp;
    data['otp_expiry'] = otpExpiry;
    data['is_verified'] = isVerified;
    data['active'] = active;
    data['stripe_customer_id'] = stripeCustomerId;
    data['routes_starred_ids'] = routesStarredIds;
    if (level != null) {
      data['level'] = level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? description;

  Level({this.id, this.description});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    return data;
  }
}

class IdNameModel {
  int? id;
  String? name;

  IdNameModel({this.id, this.name});

  IdNameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Steps {
  int? id;
  int? routeId;
  int? routeTravelMethodId;
  int? order;
  String? description;
  int? isStart;
  int? isFinish;
  int? distance;
  int? duration;
  Geopos? geoPos;
  double? locLat;
  double? locLong;
  List<Audios>? audios;
  IdNameModel? travelMethod;

  Steps(
      {this.id,
      this.routeId,
      this.routeTravelMethodId,
      this.order,
      this.description,
      this.isStart,
      this.isFinish,
      this.distance,
      this.duration,
      this.geoPos,
      this.locLat,
      this.locLong,
      this.audios,
      this.travelMethod});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    routeId = json['route_id'];
    routeTravelMethodId = json['route_travelmethod_id'];
    order = json['order'];
    description = json['description'];
    isStart = json['is_start'];
    isFinish = json['is_finish'];
    distance = json['distance'];
    duration = json['duration'];
    geoPos = json['geopos'] != null ? Geopos.fromJson(json['geopos']) : null;
    locLat = json['loc_lat'];
    locLong = json['loc_long'];
    if (json['audios'] != null) {
      audios = <Audios>[];
      json['audios'].forEach((v) {
        audios!.add(Audios.fromJson(v));
      });
    }
    travelMethod = json['travelmethod'] != null ? IdNameModel.fromJson(json['travelmethod']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['route_id'] = routeId;
    data['route_travelmethod_id'] = routeTravelMethodId;
    data['order'] = order;
    data['description'] = description;
    data['is_start'] = isStart;
    data['is_finish'] = isFinish;
    data['distance'] = distance;
    data['duration'] = duration;
    if (geoPos != null) {
      data['geopos'] = geoPos!.toJson();
    }
    data['loc_lat'] = locLat;
    data['loc_long'] = locLong;
    if (audios != null) {
      data['audios'] = audios!.map((v) => v.toJson()).toList();
    }
    if (travelMethod != null) {
      data['travelmethod'] = travelMethod!.toJson();
    }
    return data;
  }
}

class Geopos {
  String? type;
  List<double>? coordinates;

  Geopos({this.type, this.coordinates});

  Geopos.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Audios {
  int? id;
  int? routeStepId;
  String? name;
  String? path;
  String? runtime;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Audios(
      {this.id, this.routeStepId, this.name, this.path, this.runtime, this.createdAt, this.updatedAt, this.deletedAt});

  Audios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    routeStepId = json['route_step_id'];
    name = json['name'];
    path = json['path'];
    runtime = json['runtime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['route_step_id'] = routeStepId;
    data['name'] = name;
    data['path'] = path;
    data['runtime'] = runtime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Images {
  int? id;
  String? path;

  Images({this.id, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['path'] = path;
    return data;
  }
}
