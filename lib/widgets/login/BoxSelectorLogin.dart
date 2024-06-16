import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.91, vertical: 12),
        width: 169,
        height: 196,
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white, // Highlight color
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? const Color(0xFF5B61D7) : const Color(0xFFB6B6B6), // Highlight color
            width: 0.75,
          ),
          boxShadow: [
            BoxShadow(
              color:  Colors.grey.withOpacity(isSelected ? 0.3 : 0.01),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              (title == 'Sou um\nresponsável') ? 'assets/gifs/login_glasses.png' : 'assets/gifs/login_pig.png', 
              height: 84, 
              width: 84, 
              color: isSelected ? const Color(0xFF5D61D6) : const Color(0xFFB6B6B6)
            ),  
            const Spacer(),
            Expanded(
              child: Text(
                title, 
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: isSelected ? const Color(0xFF5D61D6) : const Color(0xFFB6B6B6)
                  )
                )
              ),
              
          ],
        ),
      ),
    );
  }
}
