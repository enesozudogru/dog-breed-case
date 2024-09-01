import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 98),
        painter: BottomNavBarPainter(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBottomNavItem("assets/icons/home.png", 'Home', 0),
            _buildBottomNavItem("assets/icons/settings.png", 'Settings', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ImageIcon(
            AssetImage(icon),
            color: selectedIndex == index ? const Color(0xFF0055D3) : Colors.black,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: selectedIndex == index ? const Color(0xFF0055D3) : Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(13, 13);
    path.cubicTo(15, 5, 21, 0, 29, 0);
    path.lineTo(size.width - 51, 0);
    path.cubicTo(size.width - 18, 0, size.width - 13, 5, size.width - 10, 13);
    path.lineTo(size.width, 98);
    path.lineTo(0, 98);
    path.lineTo(13, 13);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xFFF2F2F7).withOpacity(1);
    canvas.drawPath(path, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
