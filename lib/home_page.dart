import 'package:flutter/material.dart';
import 'settings.dart';
import 'dart:math' as math show sin, pi, sqrt;
import 'package:starsview/starsview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sound = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF6D71D2),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/title.png',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF6D71D2),
                    Color(0xFF202475),
                  ],
                ),
              ),
            ),
            StarsView(
              fps: 60,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Center(
                ///Here is our animation widget
                child: DogState(sound: sound),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogState extends StatelessWidget {
  final int sound;

  const DogState({Key? key, required this.sound}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // default
    if (sound == 1) {
      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF6D71D2).withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 1),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/dog_state/dog_floating.png',
            ),
          ),
        ],
      );
    }
    // when dog is barking
    else if (sound == 2) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF6D71D2).withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Stack(
          children: [
            WaveAnimation(
              size: 170,
              color: Colors.white,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/dog_state/dog_bark.png',
              ),
            ),
          ],
        ),
      );
    }
    // when dog broke something
    else if (sound == 3) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF6D71D2).withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Stack(
          children: [
            WaveAnimation(
              size: 170,
              color: Colors.white,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/dog_state/dog_bark.png',
              ),
            ),
          ],
        ),
      );
    }
    // when dog escaped
    else {
      return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF6D71D2).withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Stack(
          children: [
            WaveAnimation(
              size: 170,
              color: Colors.red,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/dog_state/escaped.png',
              ),
            ),
          ],
        ),
      );
    }
  }
}

class WaveAnimation extends StatefulWidget {
  final double size;
  final Color color;

  const WaveAnimation({
    this.size = 80.0,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  WaveAnimationState createState() => WaveAnimationState();
}

class WaveAnimationState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController animCtr;

  @override
  void initState() {
    super.initState();
    animCtr = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  Widget getAnimatedWidget() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size),
          gradient: RadialGradient(
            colors: [
              widget.color,
              Color.lerp(widget.color, Colors.black, .05)!
            ],
          ),
        ),
        child: ScaleTransition(
          scale: Tween(begin: 0.95, end: 1.0).animate(
            CurvedAnimation(
              parent: animCtr,
              curve: CurveWave(),
            ),
          ),
          child: Container(
            width: widget.size * 0.5,
            height: widget.size * 0.5,
            margin: const EdgeInsets.all(6),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return CustomPaint(
      painter: CirclePainter(animCtr, color: widget.color),
      child: SizedBox(
        width: widget.size * 1.6,
        height: widget.size * 1.6,
        child: getAnimatedWidget(),
      ),
    );
  }

  @override
  void dispose() {
    animCtr.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final Animation<double> animation;

  CirclePainter(
    this.animation, {
    required this.color,
  }) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (0.9 - (value / 4.0)).clamp(0.0, 1.0);
    final Color rippleColor = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = rippleColor;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class CurveWave extends Curve {
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}
