import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(placeholder: MemoryImage(kTransparentImage), image: AssetImage('assets/asset.jpg')),
        Positioned(child: 
        Container(color: Colors.black12,
          height: 12,width: 30,
        )
        )
      ],
    );
  }
}