import 'package:dating_app/screens/HomeScreen/widget/home_page_action_buttons.dart';
import 'package:flutter/material.dart';

class HomePageListItems extends StatelessWidget {
  final int index;

  const HomePageListItems({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isLandscape = screenWidth > screenHeight;

    return Stack(
      children: [
        PageView.builder(
          scrollDirection: isLandscape ? Axis.vertical : Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int photoIndex) {
            return Container(
              margin: const EdgeInsets.only(right: 8.0),
              width: isLandscape ? screenWidth * 0.8 : 200,
              height: isLandscape ? screenHeight * 0.8 : 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  photoIndex == 0
                      ? "assets/images/photo2.png"
                      : "assets/images/photo.png",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              bottom: isLandscape ? screenHeight * 0.1 : 105,
              left: isLandscape ? screenWidth * 0.05 : 17,
            ),
            color: Colors.black.withOpacity(0.3),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Interest",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(isLandscape ? 8.0 : 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 25,
                ),
                HomePageActionButtons(
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
