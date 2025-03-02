part of 'chat_cubit.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});
}
