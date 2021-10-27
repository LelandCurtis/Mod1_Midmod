require './lib/student'

describe Student do
  before(:each) do
    @name = "Steve"
    @age = 12
    @student = Student.new({name: @name, age: @age})
  end
  it 'exists' do
    expect(@student).to be_a(Student)
  end
  it 'has attributes' do
    expect(@student.name).to eq("Steve")
    expect(@student.age).to eq(12)
    expect(@student.scores).to be_a(Array)
    expect(@student.scores).to eq([])
  end

  describe ' #log_score' do
    it 'adds to the scores array' do
      expect(@student.scores).to eq([])
      @student.log_score(89)
      expect(@student.scores).to eq([89])
      @student.log_score(78)
      expect(@student.scores).to eq([89, 78])
    end
  end

  describe ' #grade' do
    it 'returns the average of all the scores' do
        expect(@student.scores).to eq([])
        @student.log_score(89)
        expect(@student.grade).to eq(89)
        @student.log_score(78)
        expect(@student.grade).to eq(83.5)
    end
  end
end
