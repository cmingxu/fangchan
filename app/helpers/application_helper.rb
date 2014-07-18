# -*- encoding : utf-8 -*-
module ApplicationHelper
  def placehold(w, h, b = "ffffff", f ="eeeeee", t = "placehod")
      raw("http://placehold.it/#{w}x#{h}/#{b}/#{f}?text=#{t.gsub(/\s+/, '+')}")
  end
end
