# Encoding: utf-8

module Tictactoe
  class Board
    BLANK = ''

    attr_reader :width, :number_of_spaces, :number_of_blanks, :number_of_occupied

    def initialize(width)
      @width = width
      @number_of_spaces = @number_of_blanks = width**2
      @number_of_occupied = 0
      board_range = (0..(width - 1)).to_a
      @blank_spaces = board_range.product(board_range).map { |s| s.join }
      @board = Array.new(@number_of_spaces) { BLANK }
    end

    def blank?
      @number_of_blanks == @number_of_spaces
    end

    def place_piece(piece, space)
      unless piece == BLANK
        i = space.first * @width + space.last
        @board[i] = piece
        @number_of_blanks -= 1
        @number_of_occupied += 1
        @blank_spaces.delete(space.join)
      end
      self
    end

    def contents_of(space)
      i = space.first * @width + space.last
      @board[i]
    end

    def blank_spaces
      @blank_spaces.map { |space| space.split(//).map(&:to_i) }
    end

    def copy
      board_copy = dup
      board_copy.blank_spaces = @blank_spaces.dup
      board_copy.board = @board.dup
      board_copy
    end

    protected

    attr_writer :board, :blank_spaces
  end
end
