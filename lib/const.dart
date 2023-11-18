String clintId = 'd7a127a79837406d821989c35042ef7d';
String clientSecret = 'f757bcad25ac4f7ab5a2bdd6fb123731';
String state = 'HGW348YSHB';
String code = '';

String extractCodeFromUrl({required String redirectUrl}) {
  RegExp regExp = RegExp(r'code=([^&]+)');
  Match match = regExp.firstMatch(redirectUrl) as Match;
  String? code = match.group(1);
  return code ?? '';
}
