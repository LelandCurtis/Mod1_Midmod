require './lib/term'

describe Term do
  before(:each) do
    @student1 = Student.new({name: "Abby", age: 21})
    @student2 = Student.new({name: "Bob", age: 22})
    @student3 = Student.new({name: "Charlie", age: 23})
    @student4 = Student.new({name: "Dan", age: 24})
    @student5 = Student.new({name: "Derek", age: 25})
    @student6 = Student.new({name: "Aardvark", age: 26})
    @name = "Winter 2018"
    @term = Term.new(@name)
  end
  it 'exists' do
    expect(@term).to be_a(Term)
  end

  it 'has attributes' do
    expect(@term.name).to eq(@name)
    expect(@term.courses).to eq({})
  end

  describe ' #add_course' do
    it 'creates a new entry in the courses hash' do
      expect(@term.courses).to eq({})
      @term.add_course("Calculus", 2)
      @term.add_course("Geography", 3)
      @term.add_course("History", 3)
      expect(@term.courses.keys.length).to eq(3)
    end
    it 'creates a new empty course entry with correct values' do
      expect(@term.courses).to eq({})
      @term.add_course("Calculus", 2)
      @term.add_course("Geography", 3)
      @term.add_course("History", 3)
      expect(@term.courses["Calculus"].capacity).to eq(2)
      expect(@term.courses["Calculus"].full?).to eq(false)
      expect(@term.courses["Calculus"].students).to eq([])
    end
    it 'creates a new course that can be adjusted' do
      expect(@term.courses).to eq({})
      @term.add_course("Calculus", 2)
      @term.add_course("Geography", 3)
      @term.add_course("History", 3)
      @term.courses["Calculus"].enroll(@student1)
      expect(@term.courses["Calculus"].capacity).to eq(2)
      expect(@term.courses["Calculus"].full?).to eq(false)
      expect(@term.courses["Calculus"].students).to eq([@student1])
      @term.courses["Calculus"].enroll(@student2)
      expect(@term.courses["Calculus"].full?).to eq(true)
      expect(@term.courses["Calculus"].students).to eq([@student1, @student2])
    end
  end

  describe ' #open_courses' do
    it 'returns a list of all courses that are open' do
      expect(@term.open_courses).to eq([])
      @term.add_course("Calculus", 2)
      @term.add_course("Geography", 3)
      @term.add_course("History", 3)
      expect(@term.open_courses).to eq(['Calculus','Geography','History'])
      @term.courses["Calculus"].enroll(@student1)
      @term.courses["Calculus"].enroll(@student2)
      expect(@term.open_courses).to eq(['Geography','History'])
      @term.courses["Geography"].enroll(@student1)
      @term.courses["Geography"].enroll(@student2)
      expect(@term.open_courses).to eq(['Geography','History'])
      @term.courses["History"].enroll(@student4)
      @term.courses["History"].enroll(@student5)
      @term.courses["History"].enroll(@student6)
      expect(@term.open_courses).to eq(['Geography'])
    end
  end
  describe ' #students' do
    it 'returns a list of all students in all courses' do
      expect(@term.students).to eq([])
      @term.add_course("Calculus", 2)
      @term.add_course("Geography", 3)
      @term.add_course("History", 3)
      expect(@term.students).to eq([])
      @term.courses["Calculus"].enroll(@student1)
      @term.courses["Calculus"].enroll(@student2)
      expect(@term.students).to eq([@student1, @student2])
      @term.courses["Geography"].enroll(@student1)
      @term.courses["Geography"].enroll(@student2)
      expect(@term.students).to eq([@student1, @student2])
      @term.courses["History"].enroll(@student4)
      @term.courses["History"].enroll(@student5)
      @term.courses["History"].enroll(@student6)
      expect(@term.students).to eq([@student6, @student1, @student2, @student4, @student5])
    end
  end
end
