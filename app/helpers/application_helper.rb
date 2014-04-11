module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Nordorder"      
    end
  end
end
