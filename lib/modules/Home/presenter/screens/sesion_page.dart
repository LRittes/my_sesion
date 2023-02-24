import 'package:flutter/material.dart';

class SesionPage extends StatefulWidget {
  const SesionPage({super.key});

  @override
  State<SesionPage> createState() => _SesionPageState();
}

class _SesionPageState extends State<SesionPage> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Material(
      child: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.secondary,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/'),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: color.onPrimary,
                        size: 18,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.update,
                            color: color.onPrimary,
                            size: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever,
                            color: color.onPrimary,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Text(
                        "Legs + Calves",
                        style: TextStyle(
                          color: color.onPrimary,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "wednesday, 21/03/2023",
                        style: TextStyle(
                          color: color.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
