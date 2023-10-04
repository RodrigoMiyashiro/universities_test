import 'package:flutter/material.dart';
import 'package:universities/ui/utils/widget_utils.dart';

import 'modal_university_detail.dart';

class UniversityList extends StatelessWidget {
  final List<dynamic> universities;

  const UniversityList({
    super.key,
    required this.universities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: universities.length,
      itemBuilder: (context, index) {
        final university = universities[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                title: Text(university['name']),
                subtitle: Text(university['country']),
                onTap: () {
                  WidgetUtils.showModalUtils(
                    context,
                    ModalUniversityDetail(
                      name: university['name'],
                      country: university['country'],
                      siteURL: List<String>.from(university['web_pages']),
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
