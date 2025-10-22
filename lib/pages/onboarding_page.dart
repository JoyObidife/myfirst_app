import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/widgets/custom_indicator.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  // for tracking what is next and previous, variable or state was created.
  int activeIndex = 0;
  

  List<OnboardingItem> items = [
    OnboardingItem(
      title: "Welcome to MediCall",
     subtitle: "Be prepared. Get immediate ambulance support when you need it most",
      asset: "assets/onboardingscreenn.jpg"
      ),
      OnboardingItem(
        title: "Help is On The Way", 
        subtitle: "Providing a swift path to care in critical moments", 
        asset: "assets/image2.jpg"
        ),
        OnboardingItem(
          title: "Compassionate Care ", 
          subtitle: "We are here for you in critical moments", 
          asset: "assets/image.jpg"
          ),
  ];

  @override
  Widget build(BuildContext context) {
    var onboardingItemToShow = items[activeIndex];
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          CustomIndicator(indicatorCount: items.length, activeIndex: activeIndex),
           

          Image.asset(onboardingItemToShow.asset, width: 300, height: 300),
          Text(
            
            onboardingItemToShow.title,
            style: GoogleFonts.aDLaMDisplay(
              fontWeight: FontWeight.w600,
               fontSize: 32,
          ),
          ), 

        Text(
          onboardingItemToShow.subtitle,
            style: GoogleFonts.k2d(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeIndex <= 0
                ? SizedBox(height: 0, width: 0)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = activeIndex - 1;
                      });
                    },
                    child: Text("Back"),
                  ),
            ElevatedButton(
              onPressed: () {
                if (activeIndex < items.length - 1) {
                  setState(() {
                    activeIndex = activeIndex + 1;
                  });
              } else {
                Navigator.of(context).pushReplacementNamed("/login");
              }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem{
String title;
String subtitle;
String  asset;

OnboardingItem({
  required this.title,
  required this.subtitle,
  required this.asset,

});

}