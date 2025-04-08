import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyTile extends StatelessWidget {
  const EmergencyTile({
    required this.image,
    required this.subtitle,
    required this.title,
    required this.onTap,
    super.key,
  });
  final String image;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Card(
        elevation: 0,
        color: Colors.green.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          subtitle: Text(subtitle),
          trailing: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    // final call = 'tel:$subtitle';

                    log('kamal');
                    launchUrl(Uri(scheme: 'tel', path: subtitle));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Call',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
              // Image.asset(
              //   'assets/images/move.png',
              //   height: 15,
              //   color: Theme.of(context).colorScheme.primary,
              // ),

              ),
        ),
      ),
    );
  }
}
