require './lib/student'
require './lib/course'

describe Course do
  before(:each) do
    @name = "Calculus"
    @capacity = 2
    @course = Course.new(@name, @capacity)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Steve", age: 24})
  end
  it 'exists' do
    expect(@course).to be_a(Course)
  end

  it 'has attributes' do
    expect(@course.name).to eq(@name)
    expect(@course.capacity).to eq(@capacity)
    expect(@course.students).to eq([])

  end

  describe ' #full?' do
    it 'returns false if enrolled students are less than capacity' do
      expect(@course.full?).to eq(false)
      @course.enroll(@student1)
      expect(@course.full?).to eq(false)
    end
    it 'returns true if enrolled students are equal to capacity' do
      expect(@course.full?).to eq(false)
      @course.enroll(@student1)
      @course.enroll(@student2)
      expect(@course.full?).to eq(true)

    end
    it 'returns true if enrolled students are greater than capacity' do
      expect(@course.full?).to eq(false)
      @course.enroll(@student1)
      @course.enroll(@student2)
      @course.enroll(@student3)
      expect(@course.full?).to eq(true)
    end
  end

  describe ' #enroll' do
    it 'adds a student to the end of the students array' do
      expect(@course.students).to eq([])
      @course.enroll(@student1)
      expect(@course.students).to eq([@student1])
      @course.enroll(@student2)
      expect(@course.students).to eq([@student1, @student2])
    end
  end

end
