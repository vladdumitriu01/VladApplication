class CampaignsController < ApplicationController
  def show_campaigns
    campaigns = Campaign.all
    @attribute_names = campaigns.map(&:name)
    render 'campaigns'
  end
  def redirect
    @placed_votes = Campaign.find_by_name(params[:value]).place_votes
    render 'campaigns/place_votes' # Render the desired HTML view template
  end
end