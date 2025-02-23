import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typesense_client/app.controller.dart';
import 'package:typesense_client/collection.list.screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Container(
          height: 180,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.blue, Colors.pink],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Typesense Client',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Typesense Client Interface built with Flutter.\nUpdated: 2024-01-17',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Enter the URL and API Key'),
              ),
              TextField(
                controller: App.of.url,
                decoration: InputDecoration(
                  label: Text('Input Typesense Server API URL'),
                  hintText: 'https://typesense.my-domain.com',
                ),
              ),
              TextField(
                controller: App.of.apiKey,
                decoration: InputDecoration(
                  label: Text('Input Typesense API Key'),
                  hintText: 'api-key-secret',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (App.of.url.text.startsWith('http') == false) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                              'Typesense Server Url must begin with - "http://" or "https://"'),
                        ),
                      );
                      return;
                    }

                    if (App.of.apiKey.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Input API Key'),
                        ),
                      );
                      return;
                    }

                    App.to.updateConnectionInfomation();
                    Get.toNamed(CollectionListScreen.routeName);
                  },
                  child: Text('Continue'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
