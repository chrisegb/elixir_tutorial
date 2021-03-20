defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  
  @doc """
    Returns a list of strings representing a deck of playing cards

  ## Example

      iex> deck = Cards.create_deck
      iex> deck

  """
  def create_deck do
    values = ["Ace", "Two","Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns the given deck shuffled

  ## Example

      iex> deck = Cards.create_deck
      iex> Cards.shuffle(deck)

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determins whether a deck contains a given card

  ## Example

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into hand and the reminder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    It saves the created deck into a file.
    The `file_name` argument should be a string with the name of the file

  ## Example

      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "my_deck")

  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  @doc """
    It loads a file specified with `file_name`
    where a deck was stored and shows its content

  ## Example

      iex> Cards.load("file")

  """
  def load(file_name) do
    case File.read(file_name) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _ } -> "The file does not exist"
    end
  end

  @doc """
    It creates a hand by creating a deck, then shuffling the deck and dealing the hand

  ## Example

      iex> Cards.create_hand(5)

  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
