import 'package:flutter/material.dart';
import 'package:dating_app/screens/HomeScreen/widget/home_page_action_buttons.dart';

class HomePageListItems extends StatelessWidget {
  final int index;
  final String about;
  final String interest;
  final List<String> imageUrls;
  

  const HomePageListItems({
    Key? key,
    required this.index,
    required this.about,
    required this.interest,
    required this.imageUrls,
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
          itemCount: imageUrls.length,
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
                child: Image.network(
                  imageUrls[photoIndex],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                
                Text(
                  about,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  interest,
                  style: const TextStyle(
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
    child: GestureDetector(
      onTap: () {
       // Get.to(Profiles(user:,));
      },
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
              onPressed: () {

               // Get.to(const FavouriteScreen());
              },
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    ),
  ),
),

      ],
    );
  }
}
