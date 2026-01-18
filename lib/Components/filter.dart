import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> attributes = [
    "Halal",
    "Organic",
    "Alcohol",
    "Vegetarian",
  ];

  int? selectedIndex; // radio selected

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: size.height * 0.55,
              width: size.width*0.90,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  const Text(
                    "Attributes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: attributes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(attributes[index]),
                          trailing: Radio<int>(
                            value: index,
                            groupValue: selectedIndex,
                            onChanged: (value) {
                              setState(() {
                                selectedIndex = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: size.width*0.90,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = null;
                      });
                    },
                    child: const Text("Clear all"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIndex != null) {
                        print(
                          "Selected: ${attributes[selectedIndex!]}",
                        );
                      }
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Done"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
