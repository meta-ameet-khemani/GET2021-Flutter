import '../core_services/api_config_service.dart';
// import 'package:standar_structure/models/enums/http_methods.dart';

import 'api_config/base_config.dart';

abstract class IServiceConfig {
  getConfig(String identifier);
}

class ServiceConfig implements IServiceConfig {
  final _baseConfig = BaseConfig;
  var _configs = {};

  ServiceConfig() {
    _configs = {
      ...PostConfigService.getConfig(),
      ...TmdbMovieConfigService.getConfig(),
    };
  }

  @override
  getConfig(String identifier) {
    var config = _configs.containsKey(identifier)
        ? {..._baseConfig, ..._configs[identifier]}
        : null;
    // print(config);
    // if (config != null && _isValidConfig(config)) {
    //   return config;
    // }
    if (config != null) {
      return config;
    }
    return null;
  }

  // _isValidConfig(var config) {
  //   print(config['http_method'].runtimeType == HTTPMETHODS);
  //   print(config.containsKey('url'));
  //   print(config['url'].length > 0);
  //   print(config['url'].startsWith('/'));
  //   if (config['http_method'].runtimeType == HTTPMETHODS &&
  //       (config.containsKey('url') &&
  //           config['url'].length > 0 &&
  //           config['url'].startsWith('/'))) {
  //     return true;
  //   }
  //   print('Config not valid');
  //   return false;
  // }
}
