class Card

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  attr_reader :face_value 
  attr_accessor :face_up

  def hide
    self.face_up = false if self.face_up == true
  end

  def reveal
    self.face_up = true if self.face_up == false
  end

  def display
    if self.face_up
      self.face_value
    else
      " "
    end
  end

end