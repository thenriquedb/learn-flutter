import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/core/winner_rules.dart';
import 'package:tictactoe/enums/player_type.dart';
import 'package:tictactoe/enums/winner_type.dart';
import 'package:tictactoe/models/board_tile.dart';

class GameController {
  List<BoardTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer;
  bool isSinglePlayer;

  bool get hasMoves => (movesPlayer1.length + movesPlayer2.length != 9);

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles = List<BoardTile>.generate(9, (index) => BoardTile(index + 1));
  }

  void reset() {
    _initialize();
  }

  void markBoardTileByIndex(index) {
    final tile = tiles[index];

    if (currentPlayer == PlayerType.player1) {
      tile.symbol = PLAYER1_SYMBOL;
      tile.color = PLAYER1_COLOR;
      movesPlayer1.add(tile.id);
      currentPlayer = PlayerType.player2;
    } else {
      tile.symbol = PLAYER2_SYMBOL;
      tile.color = PLAYER2_COLOR;
      movesPlayer2.add(tile.id);
      currentPlayer = PlayerType.player1;
    }

    tile.enable = false;
  }

  bool _checkPlayerWinner(List<int> moves) {
    return WinnerRules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  WinnerType checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if (_checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }
}
