
import 'dart:ui';

import 'package:flutter/material.dart';

// Colors
const whiteC = Color(0xFFF9F2E5);
const greenC = Color(0xFF3F873F);
const greenLightC = Color(0xFFCAE9D9);
const blackC = Color(0xFF000000);

// Dimensions in physical pixels (px)
FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
Size size = view.physicalSize / view.devicePixelRatio;
double widthD = size.width;
double heightD = size.height;
