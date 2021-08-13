import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "";

  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }

  void initDynamicLinks() async {
    //  app is not opened
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }

    // app is in the background but not shut down
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? linkData) async {
        final Uri? deepLink = linkData?.link;

        if (deepLink != null) {
          handleDynamicLink(deepLink);
        }
      },
      onError: (OnLinkErrorException e) async {
        print(e.message);
      },
    );
  }

  handleDynamicLink(Uri uri) {
    List<String> separatedString = [];
    separatedString.addAll(uri.path.split("/"));
    if (separatedString[1] == 'post') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostScreen(separatedString[2]),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                try {
                  url = await AppUtils.buildDynamicLink();
                } catch (e) {
                  print(e);
                }
                setState(() {});
              },
              child: Text(
                'Generate Dynamic Link',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (url.isNotEmpty)
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: url,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      WidgetSpan(
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: url));
                          },
                          icon: Icon(Icons.copy),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PostScreen extends StatefulWidget {
  final String data;
  const PostScreen(this.data);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: Center(
          child: Text(
        widget.data,
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}

class AppUtils {
  ///Build a dynamic link firebase
  static Future<String> buildDynamicLink() async {
    // https://flutterdynamiclinkdemo.page.link/Zi7X
    String url = "https://flutterdynamiclinkdemo.page.link";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/post/56'),
      androidParameters: AndroidParameters(
        packageName: "com.example.dynamic_link_again",
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: "com.example.dynamic_link_again",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: "Once upon a time in the town",
        imageUrl:
            Uri.parse("https://flutter.dev/images/flutter-logo-sharing.png"),
        title: "Breaking Code's Post",
      ),
    );
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    return dynamicUrl.shortUrl.toString();
  }
}
