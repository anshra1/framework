import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:framework/src/features/auth/data/implements/data_source_repo.dart';
import 'package:framework/src/features/auth/data/sources/remote_data_source.dart';
import 'package:framework/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:framework/src/features/auth/domain/usecases/usecases.dart';
import 'package:framework/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'injection_containter.main.dart';
