import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicappui/model/album_data.dart';
import 'package:musicappui/model/artists_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 23, 31),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ListTile(
                    title: Text(
                      'Hello Bambang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0.sp,
                      ),
                    ),
                    subtitle: Text(
                      'Let\'s listen to something cool',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0.sp,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Your favorite artist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: artistsData.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 80.h,
                              margin: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40.0.r,
                                    backgroundImage: NetworkImage(
                                      artistsData[index].imageUrl,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    artistsData[index].name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 240.h,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Recent Played',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 180.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: albumsData.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 130.h,
                                width: 130.w,
                                margin: const EdgeInsets.all(4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(13.0),
                                      child: SizedBox(
                                        height: 120.h,
                                        width: 120.h,
                                        child: Image.network(
                                          albumsData[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      albumsData[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Made for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 180.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0.w),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: madeForYou.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 180.h,
                                width: 130.w,
                                margin: const EdgeInsets.all(4.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(13.0),
                                      child: SizedBox(
                                        height: 170.h,
                                        width: 130.h,
                                        child: Image.network(
                                          madeForYou[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //   bottom: 0,
                                    //   left: 0,
                                    //   right: 0,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                    //     children: [
                                    //       Text(
                                    //         madeForYou[index].title,
                                    //         style: const TextStyle(
                                    //           color: Colors.white,
                                    //           overflow: TextOverflow.ellipsis,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Blur(
                      blur: 5,
                      blurColor: Colors.transparent,
                      colorOpacity: 0.4,
                      child: Container(),
                    ),
                    Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://m.media-amazon.com/images/I/71tYun+Y8IL._SS500_.jpg'),
                            ),
                            title: SizedBox(
                              height: 30.h,
                              child: Row(
                                children: [
                                  const Text(
                                    'Easy On Me',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: const Text(
                              'Easy On Me',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      const  SizedBox(
                          height: 5.0,
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.home,
                                  color: Colors.green,
                                  size: 32.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 32.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.book_outlined,
                                  color: Colors.grey,
                                  size: 32.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.grey,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
