import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constant.dart';

//get image icon based in response code of weather
class WeatherImage {
  static Image getData(String? code) {
    switch (code) {
      case '1000':
        //clear to be add
        return _image(Constant.cloudSun);
      case '1003':
        return _image(Constant.partlyCloudy);
      case '1006':
        return _image(Constant.cloudy);
      case '1009':
        return _image(Constant.overcast);
      case '1030':
        return _image(Constant.mist);
      case '1063':
        return _image(Constant.patchyRain);
      case '1066':
        return _image(Constant.patchySnow);
      case '1069':
        return _image(Constant.patchySleet);
      case '1072':
        return _image(Constant.patchyfreezing);
      case '1087':
        return _image(Constant.thunderOutbreaks);
      case '1114':
        return _image(Constant.blowingSnow);
      case '1117':
        return _image(Constant.blizzard);
      case '1135':
        return _image(Constant.fog);
      case '1147':
        return _image(Constant.freezingFog);
      case '1150':
        return _image(Constant.patchyLightDrizzle);
      case '1153':
        return _image(Constant.lightDrizzle);
      case '1168':
        return _image(Constant.freezingDrizzle);
      case '1171':
        return _image(Constant.heavyFreezingDrizzle);
      case '1180':
        return _image(Constant.patchyLightRain);
      case '1183':
        return _image(Constant.lightRain);
      case '1186':
        return _image(Constant.moderateRainTimes);
      case '1189':
        return _image(Constant.moderateRain);
      case '1192':
        return _image(Constant.heavyRainTime);
      case '1195':
        return _image(Constant.heavyRain);
      case '1198':
        return _image(Constant.lightFreezingRain);
      case '1201':
        return _image(Constant.moderateOrHeavyFreezingRain);
      case '1204':
        return _image(Constant.lightSleet);
      case '1207':
        return _image(Constant.moderateOrHeavySleet);
      case '1210':
        return _image(Constant.patchyLightSnow);
      case '1213':
        return _image(Constant.lightSnow);
      case '1216':
        return _image(Constant.patchyModerateSnow);
      case '1219':
        return _image(Constant.moderateSnow);
      case '1222':
        return _image(Constant.patchyHeavySnow);
      case '1225':
        return _image(Constant.heavySnow);
      case '1237':
        return _image(Constant.icePellets);
      case '1240':
        return _image(Constant.lightRainShower);
      case '1243':
        return _image(Constant.moderateOrHeavyRainShower);
      case '1246':
        return _image(Constant.torrentialRainShower);
      case '1249':
        return _image(Constant.lightSleetShowers);
      case '1252':
        return _image(Constant.moderateOrHeavySleetShowers);
      case '1255':
        return _image(Constant.lightSnowShowers);
      case '1258':
        return _image(Constant.moderateOrHeavySnowShowers);
      case '1261':
        return _image(Constant.lightShowersOfIcePellets);
      case '1264':
        return _image(Constant.moderateOrHeavyShowersOfIcePellets);
      case '1273':
        return _image(Constant.patchyLightRainWithThunder);
      case '1276':
        return _image(Constant.moderateOrHeavyRainWithThunder);
      case '1279':
        return _image(Constant.patchyLightSnowWithThunder);
      case '1282':
        return _image(Constant.moderateOrHeavySnowWithThunder);
      default:
        return _image(Constant.sunny);
    }
  }

  static Image _image(String fileName) {
    return Image.asset(
      'assets/images/$fileName',
      height: 60.0,
      fit: BoxFit.cover,
    );
  }
}
