

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/theme/colors.dart';

class CustomAnimatedGrid extends HookWidget {
  const CustomAnimatedGrid({super.key,  this.itemCount = 200,  this.crossAxisCount = 20});

  final int itemCount;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final hoveredIndex = useState<int?>(null); // State to track hovered index

    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(itemCount != 200 ? 0 : -1) // Tilt the grid view slightly around the X axis
          ..rotateY(0)
          ..rotateZ(0), // Tilt the grid view slightly around the Y axis
        alignment: FractionalOffset.center,
        child: SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              return HoverAnimatedGridItem(
                index: index,
                hoveredIndex: hoveredIndex,
                crossAxisCount: crossAxisCount,
              );
            },
            itemCount: itemCount,
          ),
        ),
      ),
    );
  }
}

class HoverAnimatedGridItem extends HookWidget {
  final int index;
  final ValueNotifier<int?> hoveredIndex;
  final int crossAxisCount;

  const HoverAnimatedGridItem({
    super.key,
    required this.index,
    required this.hoveredIndex,
    required this.crossAxisCount
  });


  bool isNearby(
      int currentIndex, int hoveredIndex, int crossAxisCount, int range) {
    int currentRow = currentIndex ~/ crossAxisCount;
    int currentColumn = currentIndex % crossAxisCount;
    int hoveredRow = hoveredIndex ~/ crossAxisCount;
    int hoveredColumn = hoveredIndex % crossAxisCount;

    return (currentRow - hoveredRow).abs() <= range &&
        (currentColumn - hoveredColumn).abs() <= range;
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = hoveredIndex.value != null &&
        isNearby(index, hoveredIndex.value!, crossAxisCount, 1);
    return GestureDetector(
      onTap: () {
        hoveredIndex.value = null;
        hoveredIndex.value = index;
      },
      child: MouseRegion(
        onEnter: (_) => hoveredIndex.value = index,
        onExit: (_) => hoveredIndex.value = null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isHovered
              ? (Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(0)
            ..rotateY(0)
            ..rotateZ(0)
            ..translate(0.0, -5.0, -20.0)) // Move the item up
              : Matrix4.identity(),
          decoration: BoxDecoration(
            border: Border.all(color: brownColor),
            gradient: isHovered
                ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [greyColor, Colors.grey],
            )
                : null,
            color: isHovered ? null : Colors.transparent,
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: const Offset(20, 20),
                blurRadius: 20,
              ),
            ]
                : [],
          ),
          margin: const EdgeInsets.all(3),
          child: const Center(
            child: SizedBox(),
          ),
        ),
      ),
    );
  }
}