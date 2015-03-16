require 'csv'

# def find_frequency('file.csv', 'name')
# 	'file.csv'.downcase.split.count('name').downcase
# end

# puts find_frequency('education-mo-text-analysis.csv', 'education')










names = []
File.open('education-mo-text-analysis.csv').each_line do |line|
  if m = line.match(/\d/)
    names.push m 
  end
end

puts names.length