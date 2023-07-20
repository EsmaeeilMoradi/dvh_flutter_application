import 'package:dvh_flutter_application/common/utils.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/repo/content_repository.dart';
import 'package:dvh_flutter_application/ui/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(contetntRepository: contentRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
            if (state is HomeSuccess) {
              return ListView.builder(
                  itemCount: 5,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/img/dvh_logo.png',
                            fit: BoxFit.fitHeight,
                            height: 60,
                          ),
                        );

                      case 2:
                        return _HorizontalProductList(
                          tittle: 'جدیدترین ویدیو‌ها',
                          onTap: () {},
                          products: state.latestVideos,
                        );

                      case 3:
                        return _HorizontalProductList(
                          tittle: ' جدیدترین فایل‌های‌صوتی',
                          onTap: () {},
                          products: state.latestPodcasts,
                        );

                      case 4:
                        return _HorizontalProductList(
                          tittle: 'جدیدترین مخازن',
                          onTap: () {},
                          products: state.latestSourcecode,
                        );

                      default:
                        return Container();
                    }
                  });
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.exception.message),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                        },
                        child: const Text('تلاش دوباره')),
                  ],
                ),
              );
            } else {
              throw Exception('state is not supported');
            }
          })),
        ),
      ),
    );
  }
}

class _HorizontalProductList extends StatelessWidget {
  final String tittle;
  final GestureTapCallback onTap;
  final List<ContentEntity> products;
  const _HorizontalProductList({
    super.key,
    required this.tittle,
    required this.onTap,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(tittle,
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.subtitle1),
            TextButton(onPressed: onTap, child: Text('مشاهده همه'))
          ]),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            physics: defaultScrollPhysics,
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 176,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 176,
                                height: 189,
                                child: ImageLoadingService(
                                  imageUrl:  product.description  ,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: const Icon(
                                    CupertinoIcons.heart,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              product.price.withPriceLable,
                              style: Theme.of(context).textTheme.caption!.copyWith(  decoration: TextDecoration.lineThrough),
                    
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(product.price.withPriceLable),
                          ),
                        ],
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
