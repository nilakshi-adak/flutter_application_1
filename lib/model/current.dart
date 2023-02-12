class CurrentLocation {
  CurrentLocation({
    this.location,
    this.current,
  });

  final Location? location;
  final Current? current;

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
      );
}

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  final Condition? condition;
  final String? lastUpdatedEpoch;
  final String? lastUpdated;
  final String? tempC;
  final String? tempF;
  final String? isDay;
  final String? windMph;
  final String? windKph;
  final String? windDegree;
  final String? windDir;
  final String? pressureMb;
  final String? pressureIn;
  final String? precipMm;
  final String? precipIn;
  final String? humidity;
  final String? cloud;
  final String? feelslikeC;
  final String? feelslikeF;
  final String? visKm;
  final String? visMiles;
  final String? uv;
  final String? gustMph;
  final String? gustKph;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        lastUpdatedEpoch: json["last_updated_epoch"].toString(),
        lastUpdated: json["last_updated"].toString(),
        tempC: json["temp_c"].toString(),
        tempF: json["temp_f"].toString(),
        isDay: json["is_day"].toString(),
        windMph: json["wind_mph"].toString(),
        windKph: json["wind_kph"].toString(),
        windDegree: json["wind_degree"].toString(),
        windDir: json["wind_dir"].toString(),
        pressureMb: json["pressure_mb"].toString(),
        pressureIn: json["pressure_in"].toString(),
        precipMm: json["precip_mm"].toString(),
        precipIn: json["precip_in"].toString(),
        humidity: json["humidity"].toString(),
        cloud: json["cloud"].toString(),
        feelslikeC: json["feelslike_c"].toString(),
        feelslikeF: json["feelslike_f"].toString(),
        visKm: json["vis_km"].toString(),
        visMiles: json["vis_miles"].toString(),
        uv: json["uv"].toString(),
        gustMph: json["gust_mph"].toString(),
        gustKph: json["gust_kph"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

// https://www.weatherapi.com/docs/weather_conditions.json
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  final String? text;
  final String? icon;
  final int? code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
