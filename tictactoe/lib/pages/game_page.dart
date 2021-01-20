import 'package:flutter/material.dart';
import 'package:tictactoe/controllers/game_controller.dart';
import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/enums/player_type.dart';
import 'package:tictactoe/enums/winner_type.dart';
import 'package:tictactoe/widgets/custom_dialog.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic tac toe"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[_buildHeader(), _buildBoard(), _buildResetButton()],
      ),
    );
  }

  _buildHeader() {
    var currentPlayer = _controller.currentPlayer == PlayerType.player1
        ? PLAYER1_SYMBOL
        : PLAYER2_SYMBOL;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            currentPlayer,
            style: TextStyle(fontSize: 32, color: Colors.black26),
          ),
        )
      ],
    );
  }

  _buildResetButton() {
    return RaisedButton(
        padding: const EdgeInsets.all(20),
        child: Text("Reset"),
        onPressed: _onResetGame);
  }

  _buildBoard() {
    return Expanded(
        child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: _buildTile));
  }

  Widget _buildTile(context, index) {
    return GestureDetector(
      onTap: () => _onMarkTile(index),
      child: Container(
        color: _controller.tiles[index].color,
        child: Center(
          child: Text(
            _controller.tiles[index].symbol,
            style: TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _onResetGame() {
    setState(() {
      _controller.reset();
    });
  }

  _onMarkTile(index) {
    if (!_controller.tiles[index].enable) return;

    setState(() {
      _controller.markBoardTileByIndex(index);
    });

    _checkWinner();
  }

  _checkWinner() {
    var winner = _controller.checkWinner();

    if (winner == WinnerType.none) {
      if (!_controller.hasMoves) {
        _showTiedDialog();
      }
    } else {
      String symbol =
          winner == WinnerType.player1 ? PLAYER1_SYMBOL : PLAYER2_SYMBOL;
      _showWinnerDialog(symbol);
    }
  }

  _showWinnerDialog(String symbol) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialog(
            title: 'Player ' + symbol + ' win!',
            message: 'Press the reset button to start again!',
            onPressed: _onResetGame,
          );
        });
  }

  _showTiedDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialog(
            title: 'Game tied!',
            message: 'Press the reset button to start again!',
            onPressed: _onResetGame,
          );
        });
  }
}
