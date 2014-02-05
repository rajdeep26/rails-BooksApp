class BooksController < ApplicationController
  def index
  end

  def books
    if (params[:keyword] and (params[:keyword].strip != ""))
      keyword = params[:keyword].strip.gsub(" ", "_")
      uri = URI("http://isbndb.com/api/v2/json/B4X0N3M7/books?q=#{keyword}")
      response = Net::HTTP.get_response(uri)
      @books = JSON.parse(response.body)
    else
      @error = "Keyword required!"
      render "error"
    end
  end

  def book_details
    uri = URI("http://isbndb.com/api/v2/json/B4X0N3M7/book/#{params[:book_id]}")
    response = Net::HTTP.get_response(uri)
    @book_details = JSON.parse(response.body)
  end

  def author_details
    uri = URI("http://isbndb.com/api/v2/json/B4X0N3M7/author/#{params[:author_id]}")
    response = Net::HTTP.get_response(uri)
    @author_details = JSON.parse(response.body)
  end

  def publisher_details
    uri = URI("http://isbndb.com/api/v2/json/B4X0N3M7/publisher/#{params[:publisher_id]}")
    response = Net::HTTP.get_response(uri)
    @publisher_details = JSON.parse(response.body)
  end

end
