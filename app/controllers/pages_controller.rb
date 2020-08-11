class PagesController < ApplicationController

  def index
    @books = Book.order(:title)
  end
  def account
  end
  def _genres
  end
  def _account_books
  end
end