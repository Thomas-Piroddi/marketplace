class BooksController < ApplicationController
  def index
    @books = Book.where('purchased = false')
    @books = @books.search(params[:search]) if params[:search].present?
  if params[:condition_id].present?
      @books = @books.condition_id(params[:condition_id])
  end
  end

  def show
    if user_signed_in? && current_user != @book.user
      response = auspost_api_get
      data = JSON.parse(response.body)
      @delivery_cost = data['postage_result']['total_cost']
      @delivery_time = data['postage_result']['delivery_time']
      @full_cost = @book.price + (@delivery_cost.to_f * 100)
      session = stripe_checkout
      @session_id = session.id
    end
  end

  def new
  @book = Book.new
  @genre = Genre.all
  @conditions = Condition.all
  end

  def edit
    @genres = Genre.all
    @conditions = Condition.all
  end


  def create
    @book = current_user.books.create(book_params)
    @book.location = current_user.postcode
    @book.purchased = false
    if @book.save
      redirect_to @book, notice: 'Book creation was a success.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'The book was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = set_book
    @book.destroy if @book.present?
    redirect_to books_url, notice: 'The book was successfully destroyed.'
  end
end

def show
    # Only run if user is able to purchase item
    #
    if user_signed_in? && current_user != @book.user

      response = auspost_api_get
      data = JSON.parse(response.body)

      @delivery_cost = data['postage_result']['total_cost']
      @delivery_time = data['postage_result']['delivery_time']
      @full_cost = @book.price + (@delivery_cost.to_f * 100)
      
      session = stripe_checkout
      @session_id = session.id
    end
end