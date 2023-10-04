import 'package:flutter/material.dart';

class ModalUniversityDetail extends StatelessWidget {
  final String name;
  final String country;
  final List<String> siteURL;

  const ModalUniversityDetail({
    super.key,
    required this.name,
    required this.country,
    required this.siteURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'País',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(country),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Site',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: siteURL.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Text(
                          siteURL[index],
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
