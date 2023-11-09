import 'package:flutter/material.dart';

import '../models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
  List<Candi> _filteredCandis = [];
  String _searchQuery = '';
  final TextEditingController _searchCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat appbar dengan judul pencarian candi
      appBar: AppBar(title: Text('Pencarian Candi'),),
      //TODO: 3. Buat body berupa COlumn
      body: Column(
        children: [
      //TODO: 4. Buat TextField pencarian sebagai anak daro Column
      Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.deepPurple[50],
          ),
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Cari Candi...',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      )
      //TODO: 5. Buat ListView hasil pencarian 
          Expended(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index){
                final candi = _filteredCandis[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              candi.imageAsset,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(candi.name)                                                                                                     
                ]
                      )
                    ],
                  ),
                )
              }
            ),
          )
      ],
    ),
    );
  }
}