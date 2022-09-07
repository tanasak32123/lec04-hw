class MainController < ApplicationController

  def home 
  end

  def test
    @subjN = params[:subjN]
    @index = 0
    @blank = Array.new()
    if !params[:blank].nil? 
      @blank = params[:blank]
    end
    @score = Array.new()
    if !params[:score].nil?
      @score = params[:score]
    end
    @name = Array.new()
    if !params[:name].nil?
      @name = params[:name]
    end
  end

  def calculate
    @subjects = params[:subject][:name].zip(params[:subject][:score])
    @blank = Array.new()
    index = 0
    @subjects.each do |name, score| 
      if name == '' || score == ''
        @blank.push(index)
      end
      index += 1
    end
    if(!@blank.empty?)
      redirect_to :action => "test", :blank => @blank, :score => params[:subject][:score], :name => params[:subject][:name], :subjN => params[:subjN]
    end
    @max = 0
    @total_score = 0
    @most_score = ''
    @subjects.each do |name, score|
      if @max < score.to_i  
        @max = score.to_i
        @most_score = name
      end
      @total_score += score.to_i
    end
  end

end
