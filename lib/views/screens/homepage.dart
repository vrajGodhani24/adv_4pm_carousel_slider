import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> number = ['Rohan', 'Rahil', 'Krish', 'Sankalp', 'Namit'];
  CarouselController controller = CarouselController();
  int currentVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeOut,
                  viewportFraction: 0.8,
                  onPageChanged: (val, _) {
                    setState(() {
                      currentVal = val;
                    });
                  }),
              items: number
                  .map(
                    (e) => Container(
                      height: 250,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        e,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: number
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        controller.animateToPage(number.indexOf(e));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                            radius: 5,
                            backgroundColor: (currentVal == number.indexOf(e))
                                ? Colors.blue
                                : Colors.grey.shade400),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
