#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'
require_relative '../lib/player.rb'

def show_board(board)
  puts '-------------'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '-------------'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '-------------'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts '-------------'
end

def get_input(player, code, board)
  choice = 0
  until board.any?(choice)
    puts "#{player}. Choose a position to place an #{code}"
    puts 'Select a number between 1 and 9'
    choice = gets.chomp.to_i
    if (1..9).none?(choice)
      puts 'Invalid input'
    elsif board.none?(choice)
      puts 'Position already taken!'
    end
  end
  choice
end

puts 'Welcome to Tic Tac Toe Game'
b = Board.new
board = b.board
show_board(board)
player1 = Player.new('X')
player2 = Player.new('O')
until b.winner(b.winner_pattern) || b.draw
  choice = get_input('Player 1', 'X', board)
  b.update_board(player1.code, choice)
  puts 'Your move is displayed on the board'
  show_board(board)
  if b.winner(b.winner_pattern)
    puts 'Winner is Player 1'
    break
  elsif b.draw
    break
  else
    choice = get_input('Player 2', 'O', board)
    b.update_board(player2.code, choice)
    puts 'Your move is displayed on the board'
    show_board(board)
    puts 'Winner is Player 2' if b.winner(b.winner_pattern)
  end
end

if b.winner(b.winner_pattern)
  puts 'Congratulations'
else
  puts 'This game has ended in a draw'
end
