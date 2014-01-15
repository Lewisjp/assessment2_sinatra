require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///SpaceCat.db"

class Spacecats < ActiveRecord::Base

  def up
    create_table :Spacecats do |t|
      t.string :cat_name
      t.string :home_planet
      t.string :tagline
      t.string :superpower
      t.timestamps
    end
 
  end

  def down
    drop_table :Spacecats 
  end

	get "/" do
	  @spacecats = Spacecats.order("created_at DESC")
	  erb :"spacecats/index"
	end

  get "/spacecats/new" do
    @title = "New SpaceCat"
    @spacecats = Spacecats.new
    erb :"spacecats/new"
  end

  post "/spacecats" do
    @spacecats = Spacecats.new(params[:post])
    if @spacecats.save
      redirect "spacecats/#{@spaecats.id}"
    else
      erb :"spacecats/new"
    end
  end

  get "/spacecats/:id" do
    @spacecats = Spacecats.find(params[:id])
    @cat_name = @spacecats.cat_name
    erb :"spacecats/show"
  end

  get "/spacecats/:id/edit" do
    @spacecats = Spacecats.find(params[:id])
    @cat_name = "Mod Spacecat"
    erb :"spacecats/edit"
  end

  put "/spacecats/:id" do
    @spacecats = Spacecats.find(params[:id])
    if @spacecats.update_attributes(params[:post])
      redirect "/spacecats/#{@spacecats.id}"
    else
      erb :"spacecats/edit"
    end
  end


end



