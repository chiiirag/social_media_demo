import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'const/app_strings/app_strings.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  await Supabase.initialize(
    url: AppString.supabaseUrl,
    anonKey: AppString.supabaseAnonKey,
  );

  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
}
