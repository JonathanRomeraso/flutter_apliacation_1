import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cast_model.dart';

class ActorCard extends StatelessWidget {
  final CastModel cast;
  const ActorCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    final imageUrl = cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
        : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

    return Center(
      child: Row(
        children: [
          Container(
            width: 110,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(height: 8),
                Text(
                  cast.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  cast.character,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
