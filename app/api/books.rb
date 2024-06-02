class Books < Grape::API
  use Grape::Attack::Throttle
  resource :books do
    before { authenticate! }

    desc 'Get all books'
    get do
      Book.all
    end

    desc 'Get a book by ID'
    params do
      requires :id, type: Integer, desc: 'Book ID'
    end
    route_param :id do
      get do
        Book.find(params[:id])
      end
    end

    desc 'Create a new book'
    params do
      requires :title, type: String, desc: 'Title of the book'
      requires :short_description, type: String, desc: 'Short description of the book'
      requires :full_description, type: String, desc: 'Full description of the book'
      requires :author, type: String, desc: 'Author of the book'
    end
    post do
      Book.create!(params)
    end

    desc 'Update a book'
    params do
      requires :id, type: Integer, desc: 'Book ID'
      optional :title, type: String, desc: 'Title of the book'
      optional :short_description, type: String, desc: 'Short description of the book'
      optional :full_description, type: String, desc: 'Full description of the book'
      optional :author, type: String, desc: 'Author of the book'
    end
    put ':id' do
      book = Book.find(params[:id])
      book.update(params)
      book
    end

    desc 'Delete a book'
    params do
      requires :id, type: Integer, desc: 'Book ID'
    end
    delete ':id' do
      Book.find(params[:id]).destroy
      { message: 'Book deleted successfully' }
    end
  end
end
