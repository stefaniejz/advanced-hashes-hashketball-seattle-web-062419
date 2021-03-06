# Write your code here!
require 'pry'

 
def num_points_scored(name)
    if game_hash[:home][:players].key?(name)
        game_hash[:home][:players][name][:points]
         
    elsif game_hash[:away][:players].key?(name)
        game_hash[:away][:players][name][:points]
    end
end

def shoe_size(name)
    shoe = nil
    game_hash.each do |location, team_data|
        if team_data[:players].key?(name)
            shoe = team_data[:players][name][:shoe]
        end
    end
    shoe
end

def team_colors(team)
    game_hash.find do |location,data|
        data[:team_name] == team
    end[1][:colors]
end

def team_names
    game_hash.collect do |location, data|
      data[:team_name]
    end
   
end

def player_numbers(name)
    array = []
    game_hash.each do |location,data|
        if data[:team_name] == name
            data[:players].each do |player, info|
                array.push(info[:number])
            end
        end
    end
    array
end

def player_stats(name)
    hash = {}
    game_hash.each do |location,data|
        if data[:players].key?(name)
            hash = data[:players][name]
        end
    end
    hash
end

def big_shoe_rebounds
    shoe_size = nil
    rebounds = nil
    game_hash.each do |location,data|
        data[:players].each do |player,info|
            if shoe_size == nil || info[:shoe]>shoe_size
                shoe_size = info[:shoe]
                rebounds = info[:rebounds]
            end
        end
    end
    rebounds
end

def winning_team
    team1 = 0
    team2 = 0
    winning = ""
    game_hash[:home][:players].each do |name, info|
        team1 += info[:points]
    end
    game_hash[:away][:players].each do |name, info|
        team2 += info[:points]
    end
    if team1 > team2
        winning = game_hash[:home][:team_name]
    else
        winning = game_hash[:away][:team_name]
    end
    winning
end

def game_hash
    {
      home:{
        team_name:"Brooklyn Nets", 
        colors:["Black", "White"],
        players:{
          "Alan Anderson"=>{
            number:0,
            shoe:16,
            points:22,
            rebounds:12,
            assists:12,
            steals:3,
            blocks:1,
            slam_dunks:1
          },
          "Reggie Evans"=>{
            number:30,
            shoe:14,
            points:12,
            rebounds:12,
            assists:12,
            steals:12,
            blocks:12,
            slam_dunks:7
          },
          "Brook Lopez"=>{
            number:11,
            shoe:17,
            points:17,
            rebounds:19,
            assists:10,
            steals:3,
            blocks:1,
            slam_dunks:15
          },
          "Mason Plumlee"=>{
            number:1,
            shoe:19,
            points:26,
            rebounds:12,
            assists:6,
            steals:3,
            blocks:8,
            slam_dunks:5
          },
          "Jason Terry"=>{
            number:31,
            shoe:15,
            points:19,
            rebounds:2,
            assists:2,
            steals:4,
            blocks:11,
            slam_dunks:1
          }
        }
      },
      away:{
        team_name:"Charlotte Hornets", 
        colors:["Turquoise","Purple"],
        players:{
          "Jeff Adrien"=>{
            number:4,
            shoe:18,
            points:10,
            rebounds:1,
            assists:1,
            steals:2,
            blocks:7,
            slam_dunks:2
          },
          "Bismack Biyombo"=>{
            number:0,
            shoe:16,
            points:12,
            rebounds:4,
            assists:7,
            steals:7,
            blocks:15,
            slam_dunks:10
          },
          "DeSagna Diop"=>{
            number:2,
            shoe:14,
            points:24,
            rebounds:12,
            assists:12,
            steals:4,
            blocks:5,
            slam_dunks:5
          },
          "Ben Gordon"=>{
            number:8,
            shoe:15,
            points:33,
            rebounds:3,
            assists:2,
            steals:1,
            blocks:1,
            slam_dunks:0
          },
          "Brendan Haywood"=>{
            number:33,
            shoe:15,
            points:6,
            rebounds:12,
            assists:12,
            steals:22,
            blocks:5,
            slam_dunks:12
          }
        }
      }
    }
end

puts winning_team