require 'csv'

class SchoolLoader
  FILE_NAME = 'db/data/schools.csv'

  def self.load_schools
    csv_text = File.read(FILE_NAME)
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      School.find_or_create_by(name: row['Name'])
    end
  end
end
