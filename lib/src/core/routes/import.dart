import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:framework/src/core/constants/app_constants.dart';
import 'package:framework/src/core/pages/intial_page.dart';
import 'package:framework/src/core/pages/page_not_found.dart';
import 'package:framework/src/core/routes/names.dart';
import 'package:framework/src/core/services/config/injection_container.dart';
import 'package:framework/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:framework/src/features/auth/presentation/pages/login_page.dart';
import 'package:framework/src/features/bottom_navigation_bar/widgets/app_navigation_bar.dart';
import 'package:framework/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:framework/src/features/framework/presentation/pages/dashboard.dart';
import 'package:framework/src/features/notes/presentation/pages/pages.dart';
import 'package:framework/src/features/setting/presentation/pages/pages.dart';
import 'package:framework/src/features/workspace/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';


part 'router.dart';
part 'routes.dart';
