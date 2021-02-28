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
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 32,
                  color: (selectedIndex == 0) ? blueColor : Color(0xffC4C4C4),
                ),
                Text(
                  "Home",
                  style: blackFontStyle.copyWith(
                    fontSize: 11,
                    color:
                        (selectedIndex == 0) ? Colors.black : Color(0xffC4C4C4),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.book,
                  size: 32,
                  color: (selectedIndex == 1) ? blueColor : Color(0xffC4C4C4),
                ),
                Text(
                  "Home",
                  style: blackFontStyle.copyWith(
                    fontSize: 11,
                    color:
                        (selectedIndex == 1) ? Colors.black : Color(0xffC4C4C4),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 32,
                  color: (selectedIndex == 2) ? blueColor : Color(0xffC4C4C4),
                ),
                Text(
                  "Profile",
                  style: blackFontStyle.copyWith(
                    fontSize: 11,
                    color:
                        (selectedIndex == 2) ? Colors.black : Color(0xffC4C4C4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
