// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kreken_app/person_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../buttons.dart';


final List<PersonInfo> personInfoList = [
  PersonInfo(
      name: 'Sumejja Terzic',
      title: 'Fronted dev',
      phoneNumber: 904551359798,
      eMail: 'sumejja.terzic@mikro.com.tr',
      gitHubUrl: 'https://github.com/Sumejja2605/',
      liUrl: 'https://www.linkedin.com/in/sumejja-terzi%C4%87-b538391ab/',
      twUrl: 'https://twitter.com/SumejjaTerzic/'),
  PersonInfo(
      name: 'Göktuğ Özdemir',
      title: 'Mobile Application Developer',
      phoneNumber: 905456220497,
      eMail: 'goktug.ozdemir@parasut.com',
      gitHubUrl: 'https://www.github.com/bgoktugozdemir/',
      liUrl: 'https://www.linkedin.com/in/bgoktugozdemir/',
      twUrl: 'https://www.twitter.com/bgoktugozdemir/'),
  PersonInfo(
      name: 'Yaren Yildirim',
      title: 'Space Cowboy ',
      phoneNumber: 905438761723,
      eMail: 'yaren.yildirim@parasut.com',
      gitHubUrl:null,
      liUrl: 'https://www.linkedin.com/in/reilien-musk-0b736b229/',
      twUrl: 'https://twitter.com/_ecaeris/'),
  PersonInfo(
      name: 'Muhammet Ömer',
      title: 'Core Member ',
      phoneNumber: 905363277936,
      eMail: 'muhammet.omer@parasut.com',
      gitHubUrl: 'https://github.com/mukireus/',
      liUrl: 'https://tr.linkedin.com/in/muhammetomer/',
      twUrl: 'https://twitter.com/mukireuss/'),
];

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personInfoList.length,
        itemBuilder: (context, index) {
          final personInfo = personInfoList[index];

          return Card(
            elevation: 5,
            shadowColor: Colors.deepPurple.shade300,
            color: Colors.brown.shade50,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/pics.jpg'),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            personInfo.name,
                            style: TextStyle(
                              fontFamily: 'Dancing_Script',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple.shade400,
                            ),
                          ),
                          Text(
                            personInfo.title,
                            style: const TextStyle(
                              fontFamily: 'OpenSans-Regular',
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                           onPressed: () async {
                             final _call =
                                 Uri.parse('tel:${personInfo.phoneNumber}');

                             if (await canLaunchUrl(_call)) {
                               await launchUrl(_call);
                             }
                           },
                           child: Text(
                             personInfo.phoneNumber.toString(),
                             style:const TextStyle(
                               fontSize: 20,
                               fontFamily: 'OpenSans',
                               fontWeight: FontWeight.w300,
                               color: Colors.green,
                             ),
                           ),
                              ),
                          TextButton(
                            onPressed: () async {
                              final eMail = Uri.parse(
                                  'mailto:${personInfo.eMail}?subject:Subject Title&body:Title');
                              await launchUrl(eMail);
                            },
                            child: Text(
                              personInfo.eMail,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple.shade200,
                              ),
                            ),
                          ),
                          SocialButton(
                            gitHubUrl: personInfo.gitHubUrl,
                            liUrl: personInfo.liUrl,
                            twUrl: personInfo.twUrl,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
