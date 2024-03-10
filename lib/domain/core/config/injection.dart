
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/core/config/injection.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
 configureDependencies() => $initGetIt(getIt);
