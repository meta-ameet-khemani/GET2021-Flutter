import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class RemoteConfigPlugin extends StatelessWidget {
  const RemoteConfigPlugin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RemoteConfig>(
      future: setupRemoteConfig(),
      builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
        return snapshot.hasData
            ? WelcomeWidget(remoteConfig: snapshot.requireData)
            : Container();
      },
    );
  }
}

class WelcomeWidget extends AnimatedWidget {
  final RemoteConfig remoteConfig;

  WelcomeWidget({
    required this.remoteConfig,
  }) : super(listenable: remoteConfig);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Config Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${remoteConfig.getString('local_language')}'),
            Text('Welcome ${remoteConfig.getString('main_language')}'),
            const SizedBox(
              height: 20,
            ),
            Text('(${remoteConfig.getValue('local_language').source})'),
            Text('(${remoteConfig.getValue('main_language').source})'),
            Text('(${remoteConfig.lastFetchTime})'),
            Text('(${remoteConfig.lastFetchStatus})'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Using zero duration to force fetching from remote server.
            await remoteConfig.setConfigSettings(RemoteConfigSettings(
              fetchTimeout: const Duration(seconds: 10),
              minimumFetchInterval: Duration.zero,
            ));
            await remoteConfig.fetchAndActivate();
          } on PlatformException catch (exception) {
            // Fetch exception.
            print(exception);
          } catch (exception) {
            print(
                'Unable to fetch remote config. Cached or default values will be '
                'used');
            print(exception);
          }
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

Future<RemoteConfig> setupRemoteConfig() async {
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  // await remoteConfig.setDefaults(<String, dynamic>{
  //   'local_language': 'default local_language',
  //   'main_language': 'default main_language',
  // });
  RemoteConfigValue(null, ValueSource.valueStatic);
  return remoteConfig;
}
