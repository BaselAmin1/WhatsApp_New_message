import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class whats_app extends StatefulWidget {
  const whats_app({Key? key}) : super(key: key);

  @override
  _whats_appState createState() => _whats_appState();
}
class _whats_appState extends State<whats_app> {
  @override
  var phone ='';
  var code= '+20';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Message',
          style: TextStyle(

          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryCodePicker(
                onChanged: (value) {
                  code = value.toString();
                },
                initialSelection: 'eg',
                favorite: ['+20','eg'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              TextField(
                onChanged: (value){
                  phone=value;
                },
                decoration: const InputDecoration(
                  hintText: "Phone",
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: ()async{
                    code = code.replaceAll("+", "");
                    var url = 'https://wa.me/$code$phone';
                    if (!await launch(url)) throw 'Could not launch $url';
                  },
                  child: const Text(
                    'Send',
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
