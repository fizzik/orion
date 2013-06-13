class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

validates :title, :description, :image_url, presence: true
validates :title, uniqueness: true
validates :title, length: {maximum: 100}
validates :description, uniqueness: true
validates :image_url, allow_blank: true, format:  {
     with:    %r{\.(gif|jpg|png)$}i,
     message: 'must be a URL for GIF, JPG or PNG image.'
   }
validates :price, numericality: {greater_than_or_equal_to: 0.01}


def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by_id(row["id"]) || new
    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end


end
