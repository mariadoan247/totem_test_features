import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreTribes extends StatefulWidget {
  const ExploreTribes({
    super.key,
  });

  @override
  State<ExploreTribes> createState() => _ExploreTribesState();
}

class _ExploreTribesState extends State<ExploreTribes>
    with AutomaticKeepAliveClientMixin<ExploreTribes> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        children: const [
          SizedBox(height: 20),
          ExploreTribeCard(
            imageUrl: 'assets/images/Chahta.png',
            title: 'Chahta Foundation',
            description:
                'The Chahta Foundation connects life with culture through positive initiatives that help improve the future for Choctaw people everywhere...',
          ),
          SizedBox(height: 20),
          ExploreTribeCard(
            imageUrl: 'assets/images/Cherokee.png',
            title: 'Cherokee Nation Foundation',
            description:
                'The Cherokee Nation Foundation is a nonprofit organization serving the Cherokee Nation, a federally recognized tribe of more than...',
          ),
          SizedBox(height: 20),
          ExploreTribeCard(
            imageUrl: 'assets/images/Chickasaw.png',
            title: 'Chickasaw Foundation',
            description:
                'The Chickasaw Foundation is a 501(c)(3) nonprofit organization established in 1971. Since inception, the Chickasaw...',
          ),
          SizedBox(height: 20),
          ExploreTribeCard(
            imageUrl: 'assets/images/Muscogee.png',
            title: 'Muscogee (Creek) Nation',
            description:
                'The Chahta Foundation connects life with culture through positive initiatives that help improve the future for Choctaw people everywhere...',
          ),
        ],
      ),
    );
  }
}

class ExploreTribeCard extends StatelessWidget {
  const ExploreTribeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 150),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffA03C3C),
                Color(0xffC66640),
                Color(0xffBB6E3E),
              ],
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/donationChahta'),
              hoverColor: const Color(0x991e1e1e),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, bottom: 10.0),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0x40000000),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Gothic A1',
                        ),
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
