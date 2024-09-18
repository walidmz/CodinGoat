
import 'package:CodinGoat_flutter/src/widgets/ad_widget.dart';
import 'package:CodinGoat_flutter/src/widgets/browse_categories.dart';
import 'package:CodinGoat_flutter/src/widgets/featured_widget.dart';
import 'package:CodinGoat_flutter/src/widgets/mobiles_widget.dart';
import 'package:flutter/material.dart';
import 'package:CodinGoat_flutter/src/widgets/transition_route_observer.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/auth')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  @override
  void initState() {
    super.initState();
    

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );


    _headerScaleAnimation = Tween<double>(begin: .6, end: 1).animate(
      CurvedAnimation(
        parent: _loadingController!,
        curve: headerAniInterval,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
      this,
      ModalRoute.of(context) as PageRoute<dynamic>?,
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  Widget _buildDebugButtons() {
    const textStyle = TextStyle(fontSize: 12, color: Colors.white);

    return Positioned(
      bottom: 0,
      right: 0,
      child: Row(
        children: <Widget>[
          MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.red,
            onPressed: () => _loadingController!.value == 0
                ? _loadingController!.forward()
                : _loadingController!.reverse(),
            child: const Text('loading', style: textStyle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PopScope(
        onPopInvoked: (hasPopped) => hasPopped ? _goToLogin(context) : null,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: theme.primaryColor.withOpacity(.1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    BrowseCategories(),
                    
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FeaturedWidget(),
                    ),
                    AdWidget(),
                    MobilesWidget(),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                           Colors.deepPurpleAccent.shade100,
                           Colors.deepPurple.shade100,
                           Colors.deepPurple.shade100,
                           Colors.deepPurple.shade100,
                          ],
                        ).createShader(bounds);
                      },
                      child: Container(
                      height: 100, // Adjust height as needed
            ),
          ),
        ],
      ),
        ),
      ),
      
          ),
        ),
      ),
    );
  }
}
