defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
  	deck_length = length(Cards.create_deck)
  	assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
  	deck = Cards.create_deck
  	assert deck != Cards.shuffle deck
  end

  test "contains returns true when having a specific card" do
  	deck = Cards.create_deck

  	assert Cards.contains?(deck, "Ace of Spades")	
  end

  test "contains returns false when not having a specific card" do
  	deck = Cards.create_deck

  	refute Cards.contains?(deck, "Other")	
  end

  test "deal gives a hand" do
  	deck = Cards.create_deck
  	{hand, _} = Cards.deal(deck, 3)
  	assert length(hand) > 0
  end

  test "save creates a file" do
  	deck = Cards.create_deck
  	Cards.save(deck, "file")
  	{status, _} = File.read("file")
  	assert status == :ok
  end
end
