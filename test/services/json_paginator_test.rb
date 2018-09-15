require 'test_helper'

describe 'JsonPaginator' do
  describe '#paginated_collection' do
    it 'will return only one result when paginated' do
      create :school
      create :school
      paginator = JsonPaginator.new(collection: School.all, current_page: '1', per_page: '1')
      School.count.must_equal 2
      paginator.paginated_collection.size.must_equal 1
    end

    describe '#current_page' do
      it 'will be 1 if none passed' do
        paginator = JsonPaginator.new(collection: School.all)
        paginator.current_page.must_equal '1'
      end

      it 'will be the value passed in when passed a value' do
        paginator = JsonPaginator.new(collection: School.all, current_page: '2')
        paginator.current_page.must_equal '2'
      end
    end

    describe '#per_page' do
      it 'will be 1 if none passed' do
        paginator = JsonPaginator.new(collection: School.all)
        paginator.per_page.must_equal '10'
      end

      it 'will be the value passed in when passed a value' do
        paginator = JsonPaginator.new(collection: School.all, per_page: '1')
        paginator.per_page.must_equal '1'
      end
    end

    describe '#prev_page' do
      it 'will be nil if the current_page is 1' do
        paginator = JsonPaginator.new(collection: School.all)
        paginator.prev_page.must_be_nil
      end

      it 'will be the number before the current_page if the current_page is not 1' do
        paginator = JsonPaginator.new(collection: School.all, current_page: '2')
        paginator.prev_page.must_equal '1'
      end
    end

    describe '#next_page' do
      it 'will be nil if the current_page is equal to the total pages' do
        paginator = JsonPaginator.new(collection: School.all)
        paginator.total_pages.must_equal '1'
        paginator.current_page.must_equal '1'
        paginator.next_page.must_be_nil
      end

      it 'will be nil if the current_page is equal to the total pages' do
        10.times do
          create :school
        end
        paginator = JsonPaginator.new(collection: School.all, per_page: 3, current_page: '2')
        paginator.total_pages.must_equal '4'
        paginator.current_page.must_equal '2'
        paginator.next_page.must_equal '3'
      end
    end

    describe '#total_pages' do
      it 'will be 1 if total_size is 0' do
        paginator = JsonPaginator.new(collection: School.all)
        paginator.total_size.must_equal '0'
        paginator.total_pages.must_equal '1'
      end

      it 'will be the total number of pages based on per_page and total_size' do
        10.times do
          create :school
        end
        paginator = JsonPaginator.new(collection: School.all, per_page: '3')
        paginator.total_size.must_equal '10'
        paginator.per_page.must_equal '3'
        paginator.total_pages.must_equal '4'
      end
    end

    describe '#total_size' do
      it 'will be size of entire collection' do
        create :school
        create :school
        paginator = JsonPaginator.new(collection: School.all)
        paginator.total_size.must_equal '2'
      end
    end
  end
end
