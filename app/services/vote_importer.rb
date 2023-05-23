class VoteImporter
  def import(file_path)
    votes = 0

    File.foreach(file_path) do |line|
      line = line.strip

      # Extract the values from the line
      time_of_vote = line.match(/VOTE ([0-9]+)/)&.captures&.first
      campaign_name = line.match(/Campaign:([^ ]+)/)&.captures&.first
      validity = line.match(/Validity:([^ ]+)/)&.captures&.first
      choice = line.match(/Choice:([^ ]+)/)&.captures&.first

      # Find or create the Campaign
      campaign = Campaign.find_or_create_by(name: campaign_name)

      # Create the Vote and associate it with the Campaign
      unless choice == nil or validity != 'during'
        campaign.place_votes.create(validity: validity, choice: choice, time_of_vote: time_of_vote)
        votes += 1
      end
    end
    votes
  end
end
