import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone/features/chat/widgets/display_text_image_gif.dart';
import '../../../colors.dart';
import '../../../common/enums/message_enum.dart';

class SenderMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String userName;
  final MessageEnum repliedMessageType;

  const SenderMessageCard(
      {Key? key,
      required this.message,
      required this.date,
      required this.type,
      required this.onRightSwipe,
      required this.repliedText,
      required this.userName,
      required this.repliedMessageType})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    final isReplying = repliedText.isNotEmpty;
    return SwipeTo(
      onRightSwipe: onRightSwipe,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: senderMessageColor,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? const EdgeInsets.only(
                          left: 10,
                          right: 30,
                          top: 5,
                          bottom: 20,
                        )
                      : const EdgeInsets.only(
                          left: 5,
                          top: 5,
                          right: 5,
                          bottom: 25,
                        ),
                  child: Column(
                    children: [
                      if(isReplying) ...[
                        Text(userName , style:const
                        TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 3,),
                        Container(
                          padding:const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            color: backgroundColor.withOpacity(0.5),
                            borderRadius:const BorderRadius.all(Radius.circular(5),),
                          ),
                          child: DisplayTextImageGif(
                            message: repliedText,
                            type: repliedMessageType,
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                      DisplayTextImageGif(
                        message: message,
                        type: type,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 2,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.white60,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
