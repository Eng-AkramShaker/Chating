// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

Custom_Hub(BuildContext context) {
  // Enable
  ProgressHUD.of(context)?.showWithText('Loading...');

  // Close---------------------------------------
  //  ProgressHUD.of(context)?.dismiss();
  // Close---------------------------------------
}
