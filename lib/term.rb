require './lib/course'

class Term
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses= Hash.new()
  end

  def add_course(name, capacity)
    @courses[name] = Course.new(name, capacity)
  end

  def open_courses
    # return a list of all courses that are open_courses
    # loop through each key value pair in courses
    # check the course value, if empty, return the key
    open_courses = []
    courses.each do |name, course|
      if !course.full?
        open_courses << name
      end
    end
    return open_courses
  end

  def students
    # return a list of all students
    # loop through all courses and gather every student.
    # if array already has the student, do not add
    all_students = []
    courses.each do |name, course|
      course.students.each do |student|
        if !all_students.include?(student)
          all_students << student
        end
      end
    end

    # put in alphabetical order
    sorted_students = all_students.sort_by {|student| student.name}
    return sorted_students
  end


end
