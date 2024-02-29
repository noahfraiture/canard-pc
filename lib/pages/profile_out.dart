import 'package:canardpc/pages/register.dart';
import 'package:canardpc/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../font.dart';

class ProfileOutPage extends StatefulWidget {
  const ProfileOutPage({super.key});

  @override
  ProfileOutPageState createState() => ProfileOutPageState();
}

class ProfileOutPageState extends State<ProfileOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              // Empty space
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              ),
              // CGV
              GestureDetector(
                onTap: _openContact("https://www.canardpc.com/mentions-legales-et-cgu/"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    "Mentions légales",
                    style: getTertiaryTextStyle(context),
                  ),
                ),
              ),
              // contact us
              Container(
                  // have to put in a container for decoration and limited width
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Theme(
                      // usage of theme to avoid divider
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        childrenPadding: const EdgeInsets.all(0),
                        title: Text("Contactez-nous", style: getTertiaryTextStyle(context)),
                        children: [
                          GestureDetector(
                              onTap: _openContact("mailto:abonnement@canardpc.com"),
                              child: Container(
                                  padding: const EdgeInsets.all(3),
                                  margin: const EdgeInsets.only(bottom: 3),
                                  child: Text("abonnement@canardpc.com",
                                      style: getLinkTextStyle(context)))),
                          GestureDetector(
                            onTap: _openContact("tel:0184254080"),
                            child: Container(
                                padding: const EdgeInsets.all(3),
                                child: Text("01 84 25 40 80", style: getLinkTextStyle(context))),
                          )
                        ],
                      ))),
              // Blank space
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              ),
              // Connexion button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  'Connexion',
                  style: mediumButtonTextStyle(context),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  'Register',
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

// function that return a function that open a contact
void Function() _openContact(String contact) {
  return () => launchUrl(Uri.parse(contact)).then((value) {
        // Handle success
      }).catchError((error) {
        // Handle error
        Clipboard.setData(ClipboardData(text: contact));
      });
}
