import 'package:flutter/material.dart';
import 'package:player_pedia/features/common_widgets/app_image_view/app_image_view.dart';

class PlayerSearchCard extends StatefulWidget {
  final String profileUrl;
  final String id;
  final String title;
  final String subtitle;
  final bool isLiked;
  final bool isAdmin;
  final VoidCallback onTap;
  final VoidCallback onTapHeart;
  final VoidCallback onTapEdit;

  const PlayerSearchCard({
    Key? key,
    required this.profileUrl,
    required this.title,
    required this.subtitle,
    required this.onTap, required this.isLiked, required this.onTapHeart, required this.id, required this.isAdmin, required this.onTapEdit,
  }) : super(key: key);

  @override
  _PlayerSearchCardState createState() => _PlayerSearchCardState();
}

class _PlayerSearchCardState extends State<PlayerSearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Profile Image
              Hero(
                tag: "${widget.id}",
                child: CommonCachedImage(
                  imageUrl: widget.profileUrl,
                  width: 60,
                  height: 60,
                    borderRadius: 8,
                  key: Key('profile_image_${widget.profileUrl}'),
                ),
              ),
              // SizedBox(
              //   width: 60,
              //   height: 60,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8), // Set desired border radius
              //     child: widget.profileUrl.isNotEmpty
              //         ? Image.network(
              //       cacheHeight: 60,
              //       cacheWidth: 60,
              //       widget.profileUrl,
              //       width: 60, // Set the width of the square
              //       height: 60, // Set the height of the square
              //       fit: BoxFit.cover,
              //       loadingBuilder: (context, child, loadingProgress) {
              //         if (loadingProgress == null) {
              //           return child; // Show the image when loading completes
              //         }
              //         return Container(
              //           width: 60,
              //           height: 60,
              //           color: Colors.grey[200], // Placeholder background while loading
              //           child: const Icon(
              //             Icons.person,
              //             size: 30,
              //             color: Colors.grey,
              //           ),
              //         );
              //       },
              //       errorBuilder: (context, error, stackTrace) {
              //         return Container(
              //           width: 60,
              //           height: 60,
              //           color: Colors.grey[200], // Placeholder background on error
              //           child: const Icon(
              //             Icons.image_not_supported, // Error icon when the image fails to load
              //             size: 30,
              //             color: Colors.grey,
              //           ),
              //         );
              //       },
              //     )
              //         : Container(
              //       width: 60,
              //       height: 60,
              //       color: Colors.grey[200], // Background color for placeholder
              //       child: const Icon(
              //         Icons.person,
              //         size: 30,
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(width: 12),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Age: ${widget.subtitle}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //If admin view then show the edit button
              widget.isAdmin?
              IconButton(
                  onPressed: (){
                    widget.onTapEdit();
                  },
                  icon: Icon(Icons.edit))

                  :
              //Hart
               IconButton(
                   onPressed: (){
                     widget.onTapHeart();
                   },
                   icon: Icon(widget.isLiked?Icons.favorite:Icons.favorite_border,color:widget.isLiked?Colors.red:null )),
            ],
          ),
        ),
      ),
    );
  }
}
