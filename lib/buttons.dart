import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.gitHubUrl,
    required this.twUrl,
    required this.liUrl,
    Key? key,
  }) : super(key: key);

  final String? gitHubUrl;
  final String twUrl;
  final String liUrl;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(gitHubUrl!=null)
          IconButton(
            onPressed: () async {
              final gitHubUri = Uri.parse(gitHubUrl!);
              await launchUrl(gitHubUri);
            },
            icon: const Icon(FontAwesomeIcons.github),
            iconSize: 45,
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () async {
              final twUri = Uri.parse(twUrl);
              await launchUrl(twUri);
            },
            icon: const Icon(FontAwesomeIcons.twitter),
            iconSize: 45,
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () async {
              final liUri = Uri.parse(liUrl);
              await launchUrl(liUri);
            },
            icon: const Icon(FontAwesomeIcons.linkedin),
            color: Colors.blue,
            iconSize: 45,
          ),
        ],
      ),
    );
  }
}
