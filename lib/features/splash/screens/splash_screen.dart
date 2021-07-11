part of '../../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    splashItem(Item item) {
      return Stack(
        children: [
          Container(
            alignment: _currentIndex != 2
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: SvgPicture.asset(
              item.imageUrl,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 265,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: MyColors.kWhiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: MyColors.kPurpleSecondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      color: MyColors.kGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _currentIndex == 0
                              ? Container(
                                  width: 18,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurplePrimaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : Container(
                                  width: 12,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurpleAccentColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                          SizedBox(
                            width: 4,
                          ),
                          _currentIndex == 1
                              ? Container(
                                  width: 18,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurplePrimaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : Container(
                                  width: 12,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurpleAccentColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                          SizedBox(
                            width: 4,
                          ),
                          _currentIndex == 2
                              ? Container(
                                  width: 18,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurplePrimaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : Container(
                                  width: 12,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: MyColors.kPurpleAccentColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                        ],
                      ),
                      InkWell(
                        child: SvgPicture.asset(
                          ConstIcons.btnNext,
                        ),
                        onTap: () {
                          if (_currentIndex != 2)
                            _carouselController.nextPage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: MyColors.kLightBlueAccentColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CarouselSlider(
              items: Dummy.data
                  .map(
                    (item) => splashItem(
                      Item.fromJson(item),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  initialPage: _currentIndex,
                  height: double.infinity,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              carouselController: _carouselController,
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex == 0
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            _carouselController.previousPage();
                          },
                          child: SvgPicture.asset(ConstIcons.btnBack),
                        ),
                  _currentIndex == 2
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            _carouselController.animateToPage(2);
                          },
                          child: Text(
                            MyStrings.skip,
                            style: TextStyle(
                              color: MyColors.kBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
