part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({
    this.onTap,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Icon(
              Icons.home,
              size: 32,
              color: (selectedIndex == 0) ? blueColor : greyColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Icon(
              Icons.book_online_outlined,
              size: 32,
              color: (selectedIndex == 1) ? blueColor : greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
