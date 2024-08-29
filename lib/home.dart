import 'dart:async';

import 'package:design_joy/Utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final double _scrollSpeed = 30.0; // Adjust this value to change scroll speed
  Timer? _scrollTimer;
  late AnimationController _controller;
  bool isPro = false;

  final Color primaryColor = const Color(0xFFD9EAF0);

  @override
  void initState() {
    super.initState();
    _scrollTimer =
        Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentOffset = _scrollController.offset;

        if (currentOffset >= maxScrollExtent) {
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.animateTo(
            currentOffset + _scrollSpeed,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        }
      }
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(); // This repeats the animation indefinitely
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 0.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WE ARE MORE THAN JUST DESIGNERS.',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff3c979f).withOpacity(0.7),
                        ),
                      ),
                      // SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: 'WE ARE', // The part with different color
                          style: GoogleFonts.inter(
                            fontSize: 35,
                            height: 1,
                            wordSpacing: .5,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff3c979f)
                                .withOpacity(0.7), // Color for "WE ARE"
                          ),
                          children: [
                            TextSpan(
                              text:
                                  ' BRAND BUILDERS.\u2197', // The rest of the text
                              style: GoogleFonts.inter(
                                color: const Color(
                                    0xff3c979f), // Original color for the rest of the text
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'DESIGN SUBSCRIPTIONS FOR EVERYONE.\nPAUSE OR CANCEL ANYTIME.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          height: 1,
                          wordSpacing: .7,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[1000],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'See Plans',
                          style: GoogleFonts.rubik(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 40,
                        width: double.infinity,
                        // clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          // physics: AlwaysScrollableScrollPhysics(),
                          itemCount:
                              4, // Adjust the number of items accordingly
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Make Row take up only the required width
                                children: [
                                  Image.asset(
                                    'assets/icons/$index.png', // Replace with your image paths
                                    width: 25,
                                    height: 25,
                                    color: Colors.white.withOpacity(.7),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Item $index', // Replace with your text
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(width: 20),
                                  if (index !=
                                      3) // Add divider dot except for the last item
                                    const Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.blue, // Divider color
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/semi_circle_h1.png', // Replace with your image
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 7),
                          Image.asset(
                            'assets/semi_circle_h2.png', // Replace with your image
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Container(
                      height: 300,
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      // width: ,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListView.builder(
                        // controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 5, // Adjust the number of items accordingly
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: 14,
                              right: index == 4 ? 14 : 0,
                              top: 20,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Image.asset('assets/item$index.png',
                                height: 150, width: 160, fit: BoxFit.fill),
                          );
                        },
                      ),
                    ),
                    Positioned(
                        left: /*MediaQuery.of(context).size.width * .*/ 125,
                        top: 30,
                        child: Transform.rotate(
                          angle: -math.pi / 9,
                          child: Image.asset('assets/offer.png',
                              height: 80, width: 80, fit: BoxFit.fill),
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.all(20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text.rich(
                          TextSpan(
                            text:
                                'TIRED OF THE FREELANCE ROLLER COASTER?', // The part with different color
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              height: 1,
                              wordSpacing: .05,
                              fontWeight: FontWeight.w500,
                              color: Colors.black, // Color for "WE ARE"
                            ),
                            children: [
                              TextSpan(
                                text:
                                    ' FIND YOUR DESIGN OASIS\nAT ', // The rest of the text
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors
                                      .black, // Original color for the rest of the text
                                ),
                              ),
                              TextSpan(
                                text: 'DESIGNGOOD.IN.', // The rest of the text
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(
                                      0xff3c979f), // Original color for the rest of the text
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Positioned(
                          bottom: -7,
                          right: -6,
                          child: RotationTransition(
                            turns: _controller,
                            child: Image.asset(
                              'assets/icons/flower.png',
                              // height: 80,
                              width: 50,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'YOUR DESIGN NIRVANA \nAWAITS!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildServiceChip('Logos'),
                    _buildServiceChip('Mood Board'),
                    _buildServiceChip('Photography'),
                    _buildServiceChip('Branding'),
                    _buildServiceChip('Lookbook'),
                    _buildServiceChip('UI/UX Design'),
                    _buildServiceChip('Logo'),
                    _buildServiceChip('Packaging'),
                    _buildServiceChip('Social Media Posts'),
                    _buildServiceChip('Social Media Stories'),
                    _buildServiceChip('Social Media Reels'),
                    _buildServiceChip('Collaterals'),
                    _buildServiceChip('Brochure'),
                  ],
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconText('assets/icons/press_button.png', 'Subscribe',
                        mainTextColor: Colors.teal[700],
                        text3: ' To Your\nDesign Wishlist'),
                    _buildIconText('assets/icons/files.png', 'Your Designs,',
                        text2: ' Delivered\nOn Time,', text3: ' Every Time.'),
                    _buildIconText(
                        'assets/icons/thumbs_up.png', 'Your Vision, Perfected.',
                        text2: '\nWe’ll Revise',
                        text3: ' Until You\'re',
                        text4: ' Satisfied!'),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'See Plans',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _buildFooter(),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .45,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: const Color(0xff177d88), // Teal background color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '“ Design is everything, and \nthese guys have nailed it.”',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/semi_circle1.png', // Replace with your image
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 7),
                                Image.asset(
                                  'assets/semi_circle2.png', // Replace with your image
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        // top: 0,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: const AssetImage('assets/person.png'),
                              height: MediaQuery.of(context).size.height * .4,
                              // width: MediaQuery.of(context).size.width * .6,
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
                const SizedBox(height: 30),
                // Second Section with Text
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: primaryColor, // Light teal background color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Totally Async'),
                            // SizedBox(height: 10),
                            _buildSectionText(
                              'Are You Against Meetings? We Have Banned Them Entirely Since We Do Not Do Them Either.',
                            ),
                            const SizedBox(height: 20),
                            _buildSectionTitle('Manage With Notion'),
                            // SizedBox(height: 10),
                            _buildSectionText(
                              'Use Notion To Keep Your Design Board Organized. Easily View Jobs That Are Active, Queued, And Completed.',
                            ),
                            const SizedBox(height: 20),
                            _buildSectionTitle('Invite Your Team'),
                            // SizedBox(height: 10),
                            _buildSectionText(
                              'Invite Your Entire Team, So Anyone Can Submit Requests And Track Their Progress.',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .10,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 30,
                          right: -15,
                          child: RotationTransition(
                            turns: _controller,
                            child: const Image(
                              image: AssetImage('assets/icons/star.png'),
                              height: 120,
                              width: 80,
                              // fit: BoxFit.fill,
                            ),
                          )),
                      const Positioned(
                          bottom: 0,
                          right: 30,
                          child: Image(
                            image: AssetImage('assets/icons/circles.png'),
                            // height: MediaQuery.of(context).size.height * .27,
                            width: 120,
                            // fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 70),
                Text(
                  'MEMBERSHIP PERKS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconText2('assets/icons/fast_service.png',
                        'Incredibly\nQuick Delivery',
                        text2:
                            '\nNotion board to organize your design queue more simply.'),
                    _buildIconText2(
                        'assets/icons/money.png', 'Fixed\nMonthly Rate',
                        text2: '\nReceive Your Design In \nJust A Few Days'),
                    _buildIconText2(
                        'assets/icons/high_quality.png', 'Excellent\nQuality',
                        text2:
                            '\nThere are no surprises!\nEach month, pay the\nsame set amount.'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconText2(
                        'assets/icons/mood_board.png', 'Design\nBoard',
                        text2:
                            '\nEasily Manage\nYour Design Board\nWith Notion'),
                    _buildIconText2(
                        'assets/icons/diamond.png', 'Exclusively\nYours',
                        text2:
                            '\nEvery design you create is exclusive to you and entirely yours'),
                    _buildIconText2('assets/icons/flexibility.png',
                        'Adaptable &\nExpandable',
                        text2:
                            '\nAdjust the scale as\nnecessary, and stop or \nstop at any point.'),
                  ],
                ),

                const SizedBox(height: 70),
                // Header
                Text(
                  "OUR EXPERTISE",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal[700],
                  ),
                ),
                const SizedBox(height: 30),

                // Category Buttons
                Container(
                  height: 35,
                  child: ListView.builder(
                    // controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    // physics: AlwaysScrollableScrollPhysics(),
                    itemCount: Utils.listItem
                        .length, // Adjust the number of items accordingly
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: expertiseButton(
                          text: Utils.listItem[index]['name'],
                          color: Utils.listItem[index]['color'],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 70),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        gridImageItem('assets/image0.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        gridImageItem('assets/image1.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        gridImageItem('assets/image2.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        gridImageItem('assets/image3.png'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // See More Work Button

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'See More Work',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                // Footer Section

                Container(
                  // padding: const EdgeInsets.all(20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 35.0, top: 15, right: 20),
                        child: Text(
                          'DESIGNGOOD! The Best\nCreative Partner\nThat You Will Have'
                              .toUpperCase(), // The part with different color
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            height: 1.2,
                            // wordSpacing: .05,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Color for "WE ARE"
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: -10,
                          child: RotationTransition(
                            turns: _controller,
                            child: Image.asset(
                              'assets/icons/flower2.png',
                              height: 60,
                              width: 60,
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Image.asset(
                            'assets/icons/semi_circle.png',
                            // height: 80,
                            width: 80,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    "Learn more about how designgood\nworks and how it can help you",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        letterSpacing: -.5,
                        wordSpacing: 1,
                        height: 1.1,
                        color: Colors.teal[700],
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          // padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .18,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 30),
                          // padding: const EdgeInsets.symmetric(horizontal: 20),
                          // alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 25, left: 25),
                            // alignment: Alignment.center,
                            child: Text(
                              'Book a 15 minutes\nintro call 📞',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                fontSize: 24.0,
                                color: Colors.teal[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 50,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 6,
                                  ),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                'assets/icons/circle_arrow.png',
                                // height: MediaQuery.of(context).size.height * .2,
                                width: 60,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "JOIN US NOW!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal[700],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                switchButton(),
                const SizedBox(height: 30),
                proItem(isPro),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "or book a call",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildFAQSection(),
                const SizedBox(
                  height: 30,
                ),
                _buildEndFooter(),
                //------------------------------------------------
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .5,
                // )
              ]))),
    );
  }

  Widget _buildServiceChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 7),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 4, // Softness of the shadow
            offset: const Offset(0, 3), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildIconText(image, String text,
      {text2, text3, text4, mainTextColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xfff8e9ef),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.20), // Shadow color
                    spreadRadius: .09, // How much the shadow spreads
                    blurRadius: 7, // Softness of the shadow
                    offset: const Offset(3, 6), // Position of the shadow (x, y)
                  ),
                ]),
            child: Image.asset(
              image,
              width: 30,
              height: 30,
              color: Colors.teal[700],
            )),
        const SizedBox(height: 25),
        Container(
          // height: 50,
          width: MediaQuery.of(context).size.width * .3,
          child: Text.rich(
            TextSpan(
              text: text, // The part with different color
              style: GoogleFonts.inter(
                fontSize: 11,
                height: 1.2,
                wordSpacing: .5,
                fontWeight: FontWeight.w500,
                color: mainTextColor ?? Colors.black, // Color for "WE ARE"
              ),
              children: [
                TextSpan(
                  text: text2 ?? "", // The rest of the text
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors
                        .teal[700], // Original color for the rest of the text
                  ),
                ),
                TextSpan(
                  text: text3 ?? "", // The rest of the text
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color:
                        Colors.black, // Original color for the rest of the text
                  ),
                ),
                TextSpan(
                  text: text4 ?? "", // The rest of the text
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors
                        .teal[700], // Original color for the rest of the text
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildIconText2(
    image,
    String text, {
    text2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xfff8e9ef),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.20), // Shadow color
                    spreadRadius: .09, // How much the shadow spreads
                    blurRadius: 7, // Softness of the shadow
                    offset: const Offset(3, 6), // Position of the shadow (x, y)
                  ),
                ]),
            child: Image.asset(
              image,
              width: 30,
              height: 30,
              color: Colors.teal[700],
            )),
        const SizedBox(height: 25),
        SizedBox(
            // height: 50,
            width: 120,
            // padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text, // The part with different color
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    height: 1,
                    // wordSpacing: .5,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal[700], // Color for "WE ARE"
                  ),
                ),
                Text(
                  text2, // The part with different color
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    // height: -1,
                    fontWeight: FontWeight.w500,
                    color:
                        Colors.black, // Original color for the rest of the text
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: primaryColor,
      ),
      child: Column(
        children: [
          Text(
            'A Design Experience So Good, \nYou\'ll Never Want To Go Back.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20,
              height: 1.2,
              fontWeight: FontWeight.w700,
              color: Colors.teal[700],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: Text.rich(
              TextSpan(
                text:
                    'No more design drama. Get high-quality designs\ndelivered at lightning speed with ', // The part with different color
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.2,
                  wordSpacing: .5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black, // Color for "WE ARE"
                ),
                children: [
                  TextSpan(
                    text: '\nDESIGNGOOD', // The rest of the text
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors
                          .teal[700], // Original color for the rest of the text
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Book A Call',
              style: TextStyle(
                fontSize: 14,
                color: Colors.yellow,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildFooterIcon(
                    const Color(0xffff90e7),
                    const BorderRadius.only(
                        topLeft: Radius.circular(90),
                        bottomLeft: Radius.circular(90))),
              ),
              Expanded(
                child: _buildFooterIcon(
                    const Color(0xfffb421f),
                    const BorderRadius.only(
                      topLeft: Radius.circular(40),
                    )),
              ),
              Expanded(
                child: _buildFooterIcon(
                    const Color(0xff3e86c1),
                    const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterIcon(Color color, borderRadius, {height}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: height ?? 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
    );
  }

  // Function to build the section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.teal[700],
      ),
    );
  }

  // Function to build the section text
  Widget _buildSectionText(String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 14,
            // wordSpacing: .05,
            // letterSpacing: .05,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FREQUENTLY ASKED QUESTIONS!",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 20),
            ...Utils.questions.map((question) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal[700],
                    ),
                  ),
                  // SizedBox(height: 5),
                  Divider(
                    color: Colors.teal[700],
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/semi_circle_h1.png', // Replace with your image
                  width: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: _buildFooterIcon(
                      const Color(0xffffdc26),
                      height: 100,
                      const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEndFooter() {
    return Stack(
      children: [
        Center(
          child: Container(
            color: const Color(0xff177d88), // Background color
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DESIGNGOOD:\nYOUR CREATIVE CATALYST.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Book a Call",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuItem("Latest Projects"),
                    menuItem("Get Started"),
                    menuItem("Pricing"),
                    menuItem("Contact"),
                    menuItem("Privacy Policy"),
                    menuItem("Terms & Conditions"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        socialIcon('assets/icons/instagram.png',
                            Colors.white), // Replace with your own social icons
                        socialIcon(
                            'assets/icons/linkedin.png',
                            // height: 15,
                            width: 15,
                            Colors.white), // Replace with your own social icons
                        socialIcon('assets/icons/behance.png',
                            Colors.white), // Replace with your own social icons
                      ],
                    ),
                  ],
                ),
                //------------------------------------------
                SizedBox(
                  height: MediaQuery.of(context).size.height * .09,
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/icons/orange_curve_h.png',
                  // height: 80,
                  width: 110,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    'assets/icons/orange_curve_v.png',
                    height: 120,
                    // width: MediaQuery.of(context).size.width * .18,
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget gridImageItem(image) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
        // height: MediaQuery.of(context).size.height * .2,
        width: 160,
      ),
    );
  }

  Widget proItem(bool _pro) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _pro == false
            ? Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 25),
                decoration: BoxDecoration(
                  color: const Color(0xff177d88),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$4,999 / month",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(height: 2),
                    Text(
                      "One Request at a Time. Pause or Cancel Anytime",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Divider(
                      color: Colors.white,
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "what’s included",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "• one request at a time\n"
                      "• lightening fast delivery\n"
                      "• unlimited brands\n"
                      "• pause or cancel anytime\n"
                      "• fixed monthly rate",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 25),
                decoration: BoxDecoration(
                  color: const Color(0xff177d88),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$7,999 / month",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(height: 2),
                    Text(
                      "Double The Request. Pause or Cancel Anytime",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Divider(
                      color: Colors.white,
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "what’s included",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "• double the request\n"
                      "• lightening fast delivery\n"
                      "• unlimited brands\n"
                      "• pause or cancel anytime\n"
                      "• fixed monthly rate",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Get Started!",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget expertiseButton({required text, required color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget switchButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPro = !isPro;
        });
      },
      child: Container(
        width: 220,
        // height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              alignment: isPro ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: 100,
                height: 35,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    // width: 100,
                    // height: 40,
                    // color: Colors.teal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    child: Text(
                      'Standard',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: isPro ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  // width: 100,
                  // height: 30,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flash_on,
                        color: isPro ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Pro',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: isPro ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          height: 1.2,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget socialIcon(image, Color color, {height, width}) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 2.5,
        ),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // color: color.withOpacity(0.1),
        ),
        child: Image.asset(
          image,
          alignment: Alignment.center,
          width: width ?? 18,
          height: height ?? 18,
          // fit: BoxFit.fill,
        ));
  }
}
