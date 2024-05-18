import 'package:flutter/material.dart';
import 'package:jafarportfolio/core/theme/app_theme.dart';
import 'package:jafarportfolio/core/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: Text("<Jafar/>"),
          actions: [
            MenuButton()
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });


  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {

  final Color hoverColor = buttonColor;
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (val){
        setState(() {
          isHovering = val;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: isHovering ? hoverColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.all(20),
        child: Text(
          "Home"
        ),
      ),
    );
  }
}

