import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

PageController controlller = PageController();

int currentIndex = 0;

Widget buildNavigations(){
  return Container(
    child: Row(
      children: List.generate(5, (index) => buildDot(index))
    ),
  );
}

Widget buildDot(int index){
  return Container(
    margin: EdgeInsets.only(right: 4),
    height: 5,
    width: currentIndex == index ? 40 : 10,
    decoration: BoxDecoration(
      color: currentIndex == index ? Colors.black : Colors.grey,
      borderRadius: BorderRadius.circular(6)
    ),
  );
}

Widget nextButton() {
  return GestureDetector(
    onTap: (){
      if(currentIndex < 5){
        currentIndex++;
      }
      controlller.jumpToPage(currentIndex);
    },
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Icon(Icons.arrow_forward_ios, color: Colors.white)
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Collection', style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.grey.shade500
                  )),
                  Text('Hiver 2022', style: GoogleFonts.roboto(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildNavigations(),
                      nextButton()
                    ]
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: controlller,
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/alyssa-strohmann-TS--uNw-JqE-unsplash.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/artem-beliaikin-UdQt3FT6rxM-unsplash.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/dom-hill-nimElTcTNyY-unsplash.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/markus-spiske-jddw6iA31sE-unsplash.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/thom-bradley-mwa_nzFpnJw-unsplash.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ]
              )
            )
          ],
        )
      ),
    );
  }
}