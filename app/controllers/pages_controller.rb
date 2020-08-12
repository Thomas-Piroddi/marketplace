class PagesController < ApplicationController

  def index
    @random_book = Book.order('RANDOM()').first
    #@books = Book.order(:title)
  end
  def account
    @account = current_user
    @purchase = current_user.payments
  end
  def _genres
  end
  def _account_books
  end
end