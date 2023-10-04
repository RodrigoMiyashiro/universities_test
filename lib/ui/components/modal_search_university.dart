import 'package:flutter/material.dart';

class ModalSearchUniversity extends StatefulWidget {
  final String country;
  final Function(String) onSearch;

  const ModalSearchUniversity({
    Key? key,
    required this.country,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<ModalSearchUniversity> createState() => _ModalSearchUniversityState();
}

class _ModalSearchUniversityState extends State<ModalSearchUniversity> {
  final TextEditingController _textEditingController = TextEditingController();

  void _clearSearch() {
    setState(() {
      _textEditingController.clear();
    });
  }

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
                const Text(
                  'Pressione em "Pesquisar" para busca aleatória ou digite um país de sua universidade',
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Ex.: Brazil',
                    hintStyle: const TextStyle(
                      color: Color(0xFFBDBDBD),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _clearSearch();
                      },
                      icon: const Icon(Icons.clear_rounded),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        widget.onSearch(_textEditingController.text);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Pesquisar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
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
