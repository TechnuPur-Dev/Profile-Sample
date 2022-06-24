import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profilescreen/Controllers/controller_profile.dart';
import 'package:profilescreen/utils/colors.dart';


class DropDownSkills extends StatefulWidget {
  const DropDownSkills({Key? key}) : super(key: key);

  @override
  State<DropDownSkills> createState() => _DropDownSkillsState();
}

class _DropDownSkillsState extends State<DropDownSkills> {
  final List<String> items = [
    'Plumber',
    'Electrician',
    'Roofer',
    'VAC',
    'Plan Projects',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final ControllerProfile cProfile = Get.put(ControllerProfile());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose your skills",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: colorBorderColor,
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,

              hint: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Select Items',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  //disable default onTap to avoid closing menu when selecting an item
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final _isSelected =
                          cProfile.listItemsMySkills.contains(item);
                      return InkWell(
                        onTap: () {
                          _isSelected
                              ? cProfile.removeItem(item)
                              : cProfile.addItem(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              _isSelected
                                  ? Image.asset(
                                      "assets/images/checkBoxChecked.png")
                                  : Image.asset(
                                      "assets/images/checkBoxUnChecked.png"),
                              const SizedBox(width: 16),
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
              value: cProfile.listItemsMySkills.isEmpty
                  ? null
                  : cProfile.listItemsMySkills.last,
              onChanged: (value) {},
              buttonHeight: 40,
              // buttonWidth: 140,
              itemHeight: 40,
              itemPadding: EdgeInsets.zero,
              selectedItemBuilder: (context) {
                return items.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.centerStart,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        cProfile.listItemsMySkills.join(', '),
                        style: TextStyle(
                          fontSize: 14,
                          color: colorBodyText,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}
