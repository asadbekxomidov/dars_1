// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:flutter/widgets.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // slivers: <Widget>[
//           const SliverAppBar(
//             pinned: true,
//             title: Text('Sliver App Bar'),
//             floating: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Dynamic ToolBar',
//                   style: TextStyle(color: Colors.black, fontSize: 20)),
//             ),
//             expandedHeight: 100,
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text('List Item $index'),
//                 );
//               },
//               childCount: 60,
//             ),
//           ),
//           SliverPersistentHeader(
//             pinned: true,
//             floating: true,
//             delegate: _SliverAppBarDelegate(
//               minHeight: 60.0,
//               maxHeight: 200.0,
//               child: Container(
//                 color: Colors.green,
//                 child: const Center(
//                   child: Text(
//                     'SliverPersistentHeader 3',
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverGrid(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.teal[100 * (index % 9)],
//                   child: Text('grid item $index'),
//                 );
//               },
//               childCount: 42,
//             ),
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 180.0,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               childAspectRatio: 4.0,
//             ),
//           ),
//           SliverPadding(
//             padding: EdgeInsets.all(20.0),
//             sliver: SliverToBoxAdapter(
//               child: SizedBox(
//                 height: 200.0,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   itemExtent: 160.0,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       // color: Colors.teal.shade50,
//                       color: Colors.teal[100 * (index % 9)],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double maxHeight;
//   final double minHeight;
//   final Widget child;

//   _SliverAppBarDelegate(
//       {required this.maxHeight, required this.minHeight, required this.child});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(
//       child: child,
//     );
//   }

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   double get minExtent => maxHeight;

//   @override
//   bool shouldRebuild(covariant _SliverAppBarDelegate olDelegate) {
//     return olDelegate.maxExtent != maxHeight ||
//         olDelegate.minHeight != minHeight ||
//         olDelegate.child != child;
//   }
// }


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Sliver App Bar"),
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Dynamic toolbar"),
            ),
            expandedHeight: 200,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[(100 * (index % 9))],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minEx: 60,
              maxEx: 200,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text("SliverPersistentHeader 3"),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemExtent: 160,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.teal[100 * (index % 9)],
                    );
                  }, 
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemExtent: 160,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.teal[100 * (index % 9)],
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    color: Colors.red,
                    height: 50,
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxEx;
  final double minEx;
  final Widget child;

  _SliverAppBarDelegate(
      {required this.maxEx, required this.minEx, required this.child});

  @override
  Widget build(Object context, double shrinkOfset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxEx;

  @override
  double get minExtent => minEx;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
