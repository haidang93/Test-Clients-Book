class App {
  String app;

  App({this.app});

  App.fromJson(Map<String, dynamic> json) {
    app = json['app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app'] = this.app;
    return data;
  }
}
