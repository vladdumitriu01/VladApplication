# lib/tasks/import_votes.rake

namespace :import do
  desc "Import votes from a file"
  task :votes, [:file_path] => :environment do |_, args|
    file_path = args.file_path || 'public/votes.txt'

    if File.exist?(file_path)
      voting = VoteImporter.new
      votes = voting.import(file_path)
      puts "#{votes} votes imported from #{file_path}"
    else
      puts "File does not exist: #{file_path}"
    end
  end
end
