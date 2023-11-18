import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Repo/getTokenRepo.dart';
import '../const.dart';
import 'home.dart';

class TodoistLogin extends StatelessWidget {
  const TodoistLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print(url);

            if (url.contains("code=")) {
              code = extractCodeFromUrl(redirectUrl: url);
              EasyLoading.showSuccess('Login Done');
              getTokenRepo();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://todoist.com/oauth/authorize?client_id=$clintId&scope=data:read,data:delete&state=$state'));
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
