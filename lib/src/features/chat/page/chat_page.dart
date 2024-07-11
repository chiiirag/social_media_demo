import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/core/const/constant/constant.dart';
import 'package:social_media_demo/src/features/chat/cubit/chat_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../model/message.dart';
import '../../../model/profile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);
    return Container();
  }
}

