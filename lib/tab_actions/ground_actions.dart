import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum PixelElement { dirt, water, sand, grass }

PixelElement? getElementByColor(int? color) => elementColors.entries
    .firstWhereOrNull(
      (element) => element.value.contains(color),
    )
    ?.key;

int getElementColorIndex(PixelElement element) {
  return elementColors[element]![
      _random.nextInt(elementColors[element]!.length)];
}

// kg/m3
final density = <PixelElement, int>{
  PixelElement.water: 997,
  PixelElement.dirt: 1250,
  PixelElement.sand: 1850,
  PixelElement.grass: 1250, // idk probably like dirt
};

enum ElementState { gaz, liquid, solid }

final elementState = <PixelElement, ElementState>{
  PixelElement.water: ElementState.liquid,
  PixelElement.dirt: ElementState.solid,
  PixelElement.sand: ElementState.solid,
  PixelElement.grass: ElementState.solid,
};

final _random = Random();

Map<PixelElement, List<int>> elementColors = {
  PixelElement.dirt: const [19, 20, 21],
  PixelElement.water: const [22, 23, 24],
  PixelElement.sand: const [25, 26, 27],
  PixelElement.grass: const [28, 29, 30],
};

final colorMapping = <int, Color>{
  0: Colors.red,
  1: Colors.pink,
  2: Colors.purple,
  3: Colors.deepPurple,
  4: Colors.indigo,
  5: Colors.blue,
  6: Colors.lightBlue,
  7: Colors.cyan,
  8: Colors.teal,
  9: Colors.green,
  10: Colors.lightGreen,
  11: Colors.lime,
  12: Colors.yellow,
  13: Colors.amber,
  14: Colors.orange,
  15: Colors.deepOrange,
  16: Colors.brown,
  17: Colors.blueGrey,
  18: Colors.black,
  19: const Color(0xff645244),
  20: const Color(0xff796353),
  21: const Color(0xff866D5B),
  22: const Color(0xff109ee5),
  23: const Color(0xff2DAFF0),
  24: const Color(0xff0D84BF),
  25: const Color(0xffF5DEB3),
  26: const Color(0xffF1D093),
  27: const Color(0xffEFC881),
  28: const Color(0xff3B684D),
  29: const Color(0xff51906A),
  30: const Color(0xff6FAE89),
};

class GroundActions extends StatelessWidget {
  const GroundActions({required this.onElementChanged, super.key});

  final void Function(PixelElement selectedElement) onElementChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        FilledButton(
          onPressed: () {
            onElementChanged(PixelElement.dirt);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.brown.shade300),
          ),
          child: const Text('Dirt'),
        ),
        FilledButton(
          onPressed: () {
            onElementChanged(PixelElement.water);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff109ee5)),
          ),
          child: const Text('Water'),
        ),
        FilledButton(
          onPressed: () {
            onElementChanged(PixelElement.sand);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xffF5DEB3)),
          ),
          child: const Text('Sand'),
        ),
        FilledButton(
          onPressed: () {
            onElementChanged(PixelElement.grass);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff3B684D)),
          ),
          child: const Text('Grass'),
        ),
      ],
    );
  }
}
