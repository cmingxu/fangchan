# -*- encoding : utf-8 -*-
class Integer

  def in_human_readable_money
    if self > 10000
      (self/10000).to_s + "万"
    end
  end

  def in_human_readable_mm
    if self > 10000
      (self/10000).to_s + "万"
    end
  end
end
