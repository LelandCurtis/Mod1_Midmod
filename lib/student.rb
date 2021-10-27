class Student
  attr_reader :name, :age, :scores

  def initialize(student_info)
    @name = student_info[:name]
    @age = student_info[:age]
    @scores = []
  end

  def log_score(score)
    if score.class == Integer
      @scores << score
    else
      puts "scores must be an integer"
    end
    return @scores
  end

  def grade
    @scores.sum.to_f / @scores.length
  end
end
