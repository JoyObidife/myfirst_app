import 'package:flutter/material.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  // for tracking what is next and previous, variable or state was created.
  int activeIndex = 0;
  int count = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          CustomIndicator(indicatorCount: count, activeIndex: activeIndex),

          Image.asset("assets/onboardingscreenn.jpg", width: 350, height: 350),
          Text(
            "Welcome to MediCall",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            "We help you make ambulance requests for emergency and other purposes",
            style: TextStyle(fontSize: 18),
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
                if (activeIndex < count - 1) {
                  setState(() {
                    activeIndex = activeIndex + 1;
                  });
              } else {
                Navigator.of(context).pushNamed("/login");
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

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.indicatorCount,
    required this.activeIndex,
  });
  final int indicatorCount;
  // how to make the top buttons to look faded.
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        indicatorCount,

        (index) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeIndex == index ? Colors.blue : Colors.blue.shade200,
          ),
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}
