import 'package:flutter/material.dart';
import 'font.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  _LogoutPage createState() => _LogoutPage();
}

class _LogoutPage extends State<LogoutPage> {

  static const List<String> text = ["Tutoriel Liseuse", "Contactez-nous", "CGV", "Mentions légales", "Préférence d'affichage"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1),
              ),
              for (int i = 0; i < text.length; i++)
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surface,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    text[i],
                    style: getTertiaryTextStyle(context),
                  ),
                ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                child: const ExpandableButton(),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.05),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  'Connexion',
                  style: mediumButtonTextStyle(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandableButton extends StatelessWidget {
  const ExpandableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: [
            ExpansionPanelRadio(
              headerBuilder: (context, isExpanded) =>
              const ListTile(
                title: Text("hey"),
              ),
              body: const ListTile(
                title: Text("hello"),
              ),
              value: "hey",
            ),
          ],
        ),
      );
  }
}