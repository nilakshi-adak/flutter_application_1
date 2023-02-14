import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constant.dart';

//get image icon based in response code of weather
class WeatherImage {
  static Image getData(String? code) {
    switch (code) {
      case '1000':
        //clear to be add
        return resolveImage(Constant.cloudSun);
      case '1003':
        return resolveImage(Constant.partlyCloudy);
      case '1006':
        return resolveImage(Constant.cloudy);
      case '1009':
        return resolveImage(Constant.overcast);
      case '1030':
        return resolveImage(Constant.mist);
      case '1063':
        return resolveImage(Constant.patchyRain);
      case '1066':
        return resolveImage(Constant.patchySnow);
      case '1069':
        return resolveImage(Constant.patchySleet);
      case '1072':
        return resolveImage(Constant.patchyfreezing);
      case '1087':
        return resolveImage(Constant.thunderOutbreaks);
      case '1114':
        return resolveImage(Constant.blowingSnow);
      case '1117':
        return resolveImage(Constant.blizzard);
      case '1135':
        return resolveImage(Constant.fog);
      case '1147':
        return resolveImage(Constant.freezingFog);
      case '1150':
        return resolveImage(Constant.patchyLightDrizzle);
      case '1153':
        return resolveImage(Constant.lightDrizzle);
      case '1168':
        return resolveImage(Constant.freezingDrizzle);
      case '1171':
        return resolveImage(Constant.heavyFreezingDrizzle);
      case '1180':
        return resolveImage(Constant.patchyLightRain);
      case '1183':
        return resolveImage(Constant.lightRain);
      case '1186':
        return resolveImage(Constant.moderateRainTimes);
      case '1189':
        return resolveImage(Constant.moderateRain);
      case '1192':
        return resolveImage(Constant.heavyRainTime);
      case '1195':
        return resolveImage(Constant.heavyRain);
      case '1198':
        return resolveImage(Constant.lightFreezingRain);
      case '1201':
        return resolveImage(Constant.moderateOrHeavyFreezingRain);
      case '1204':
        return resolveImage(Constant.lightSleet);
      case '1207':
        return resolveImage(Constant.moderateOrHeavySleet);
      case '1210':
        return resolveImage(Constant.patchyLightSnow);
      case '1213':
        return resolveImage(Constant.lightSnow);
      case '1216':
        return resolveImage(Constant.patchyModerateSnow);
      case '1219':
        return resolveImage(Constant.moderateSnow);
      case '1222':
        return resolveImage(Constant.patchyHeavySnow);
      case '1225':
        return resolveImage(Constant.heavySnow);
      case '1237':
        return resolveImage(Constant.icePellets);
      case '1240':
        return resolveImage(Constant.lightRainShower);
      case '1243':
        return resolveImage(Constant.moderateOrHeavyRainShower);
      case '1246':
        return resolveImage(Constant.torrentialRainShower);
      case '1249':
        return resolveImage(Constant.lightSleetShowers);
      case '1252':
        return resolveImage(Constant.moderateOrHeavySleetShowers);
      case '1255':
        return resolveImage(Constant.lightSnowShowers);
      case '1258':
        return resolveImage(Constant.moderateOrHeavySnowShowers);
      case '1261':
        return resolveImage(Constant.lightShowersOfIcePellets);
      case '1264':
        return resolveImage(Constant.moderateOrHeavyShowersOfIcePellets);
      case '1273':
        return resolveImage(Constant.patchyLightRainWithThunder);
      case '1276':
        return resolveImage(Constant.moderateOrHeavyRainWithThunder);
      case '1279':
        return resolveImage(Constant.patchyLightSnowWithThunder);
      case '1282':
        return resolveImage(Constant.moderateOrHeavySnowWithThunder);
      default:
        return resolveImage(Constant.sunny);
    }
  }

  static Image resolveImage(String fileName, {BoxFit? boxFit, double? height}) {
    return Image.asset(
      'assets/images/$fileName',
      height: height,
      fit: boxFit,
    );
  }
}
