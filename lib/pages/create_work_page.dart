import 'package:flutter/material.dart';

class CreateWorkPage extends StatefulWidget {
  const CreateWorkPage({super.key});

  @override
  State<CreateWorkPage> createState() => _CreateWorkPageState();
}

enum Options { option1, option2, option3 }

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class _CreateWorkPageState extends State<CreateWorkPage> {
  var _option1;
  var _option2;
  Options? _selectedOption = Options.option1;
  ColorLabel? selectedColor;
  final TextEditingController colorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColorLabel>> colorEntries =
    <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel color in ColorLabel.values) {
      colorEntries.add(DropdownMenuEntry<ColorLabel>(
          value: color, label: color.label, enabled: color.label != 'Grey'));
    }
    return Column(
      children: [
        CheckboxListTile(
          tristate: true,
          value: _option1,
          title: const Text('Option 1'),
          onChanged: (value) {
            setState(() {
              _option1 = value;
            });
          },
        ),
        CheckboxListTile(
          tristate: true,
          value: _option2,
          title: const Text('Option 2'),
          onChanged: (value) {
            setState(() {
              _option2 = value;
            });
          },
        ),
        RadioListTile<Options>(
          title: const Text('Option 1'),
          value: Options.option1,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        RadioListTile<Options>(
          title: const Text('Option 2'),
          value: Options.option2,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        DropdownMenu<ColorLabel>(
          controller: colorController,
          label: const Text('Color'),
          enableFilter: true,
          dropdownMenuEntries: colorEntries,
          inputDecorationTheme: const InputDecorationTheme(filled: true),
          onSelected: (color) {
            setState(() {
              selectedColor = color;
            });
          },
        ),
      ],
    );
  }
}
