import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universities/ui/components/modal_search_university.dart';
import 'package:universities/ui/components/text_component.dart';
import 'package:universities/ui/components/university_list.dart';
import 'package:universities/ui/utils/widget_utils.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({
    super.key,
  });

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  bool _isLoading = false;
  String _country = 'Brazil';

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<List<dynamic>> getUniversities() async {
    final response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=$_country'));

    if (response.statusCode == 200) {
      final List<dynamic> universities = json.decode(response.body);

      return universities;
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Universidades',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              WidgetUtils.showModalUtils(
                context,
                ModalSearchUniversity(
                  country: _country,
                  onSearch: (search) {
                    setState(() {
                      _country = search;
                    });
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getUniversities(),
        builder: (context, snapshot) {
          List<dynamic> universities = [];
          if (snapshot.hasData) {
            universities = snapshot.data!;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return TextComponent(
              text: 'Erro: ${snapshot.error}',
            );
          }

          if (universities.isEmpty) {
            return const TextComponent(
              text: 'País não encontrado. \nPor favor, faça outra pesquisa.',
            );
          }

          return UniversityList(
            universities: universities,
          );
        },
      ),
    );
  }
}
