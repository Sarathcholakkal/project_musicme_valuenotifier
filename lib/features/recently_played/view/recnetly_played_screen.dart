import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/all_songs/view/all_song_card.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';
import 'package:musicme/features/recently_played/logic/recently_played_functions.dart';

class RecnetlyPlayedScreen extends StatefulWidget {
  const RecnetlyPlayedScreen({super.key});

  @override
  State<RecnetlyPlayedScreen> createState() => _RecnetlyPlayedScreen();
}

class _RecnetlyPlayedScreen extends State<RecnetlyPlayedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutSpacer.vertical30,
            SizedBox(
              height: 40,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  const SizedBox(
                    child: Text(
                      "Recently Played Songs",
                      style: TextStyle(
                        color: Color(0xFF5B5A5F),
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<List<SongModelClass>>(
                  valueListenable: recentlyPlayedNotifer,
                  builder: (context, songs, child) {
                    if (songs.isEmpty) {
                      return const Center(child: Text("Nothing found!"));
                    }
                    var recent25songs = songs.take(30).toList();

                    return ListView.builder(
                      itemCount: recent25songs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, int newindex) {
                        final singleSongData = recent25songs[newindex];
                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) {
                                  return PlaybackScreen(
                                      songs: songs, index: newindex);
                                },
                              ),
                            );
                          },
                          child: ListSongCard(songItem: singleSongData),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
