import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({Key key, this.countries, this.country, this.onChange})
      : super(key: key);
  final List<String> countries;
  final String country;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: country,
          items: countries
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 12,
                          child: Image.asset("assets/images/" +
                              e.toLowerCase() +
                              "_flag.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )))
              .toList(),
          onChanged: (value) {
            onChange(value);
          },
        ),
      ),
    );
  }
}
