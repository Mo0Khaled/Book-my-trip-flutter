import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final dynamic func;

  Carousel(this.func);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {


  PageController _pageController;
  int index = 1;
  @override
  void initState() {
    super.initState();
    _pageController =PageController(
      initialPage: index,
      keepPage: false,
      viewportFraction: 0.8,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        onPageChanged: (value){
          setState(() {
            index = value;
          });
        },
        controller: _pageController,
        itemBuilder: (context,index)=> buildAnimatedItemBuilder(index),
        itemCount: widget.func.length,
      ),
    );
  }

  buildAnimatedItemBuilder(int index) {
   return AnimatedBuilder(
     animation: _pageController,
     builder: (context,ch){
       double value = 1;
       if(_pageController.position.haveDimensions){
         value = _pageController.page - index;
         value = (1.1 - value.abs() * 0.25).clamp(0.0, 1.0);
       }
      return Center(
        child: SizedBox(
          height: Curves.easeInOut.transform(value) * 300,
          width: Curves.easeInOut.transform(value) * 290,
          child: ch,
        ),
      );
     },
     child: Container(
       margin: const EdgeInsets.only(top: 10),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(7),
         image:  DecorationImage(
             image: NetworkImage( "${widget.func[index]}"),
           fit: BoxFit.cover
         ),
       ),
     ),
   );
  }
}
