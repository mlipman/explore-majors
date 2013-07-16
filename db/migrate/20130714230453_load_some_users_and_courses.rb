class LoadSomeUsersAndCourses < ActiveRecord::Migration
  def up
  	course = Course.new(:dept => "Math", :num => "41", :title => "Calculus (accelerated)", :units => 5, :desc => "Introduction to differential and integral calculus of functions of one variable. Topics: limits, rates of change, the derivative and applications, introduction to the definite integral and integration. Math 41 and 42 cover the same material as Math 19-20-21, but in two quarters rather than three. Prerequisites: trigonometry, advanced algebra, and analysis of elementary functions, including exponentials and logarithms.")
  	course.save
  	course = Course.new(:dept => "Math", :num => "42", :title => "Calculus (accelerated)", :units => 5, :desc => "ontinuation of 41. Methods of symbolic and numerical integration, applications of the definite integral, introduction to differential equations, infinite series. Prerequisite: 41 or equivalent.")
  	course.save
  	course = Course.new(:dept => "Math", :num => "51", :title => "Linear Algebra and Differential Calculus of Several Variables", :units => 5, :desc => "Geometry and algebra of vectors, systems of linear equations, matrices and linear transformations, diagonalization and eigenvectors, vector valued functions and functions of several variables, parametric curves, partial derivatives and gradients, the derivative as a matrix, chain rule in several variables, constrained and unconstrained optimization. Prerequisite: 21, or 42, or a score of 4 on the BC Advanced Placement exam or 5 on the AB Advanced Placement exam, or consent of instructor.")
  	course.save

  	course = Course.new(:dept => "CS", :num => "106A", :title => "Programming Methodology (ENGR 70A)", :units => 5, :desc => "Introduction to the engineering of computer applications emphasizing modern software engineering principles: object-oriented design, decomposition, encapsulation, abstraction, and testing. Uses the Java programming language. Emphasis is on good programming style and the built-in facilities of the Java language. No prior programming experience required.")
  	course.save
  	course = Course.new(:dept => "CS", :num => "106B", :title => "Programming Abstractions (ENGR 70B)", :units => 5, :desc => "Abstraction and its relation to programming. Software engineering principles of data abstraction and modularity. Object-oriented programming, fundamental data structures (such as stacks, queues, sets) and data-directed design. Recursion and recursive data structures (linked lists, trees, graphs). Introduction to time and space complexity analysis. Uses the programming language C++ covering its basic facilities. Prerequisite: 106A or equivalent.")
  	course.save
  	course = Course.new(:dept => "CS", :num => "106X", :title => "Programming Methodology (ENGR 70X)", :units => 5, :desc => "Intensive version of 106B for students with a strong programming background interested in a rigorous treatment of the topics at an accelerated pace. Additional advanced material and more challenging projects. Prerequisite: excellence in 106A or equivalent, or consent of instructor.")
  	course.save
  	course = Course.new(:dept => "CS", :num => "107", :title => "Computer Organization and Systems", :units => 5, :desc => "Introduction to the fundamental concepts of computer systems. Explores how computer systems execute programs and manipulate data, working from the C programming language down to the microprocessor. Topics covered include: the C programming language, data representation, machine-level code, computer arithmetic, elements of code compilation, memory organization and management, and performance evaluation and optimization. Prerequisites: 106B or X, or consent of instructor.")
  	course.save

  	course = Course.new(:dept => "PSYCH", :num => "1", :title => "Introduction to Psychology", :units => 5, :desc => "Human behavior and mental processes including the nervous system, consciousness, learning, memory, development, emotion, psychopathology, interpersonal process, society, and culture. Current research.")
  	course.save
  	course = Course.new(:dept => "PSYCH", :num => "45", :title => "Introduction to Learning and Memory", :units => 3, :desc => "The literature on learning and memory including cognitive and neural organization of memory, mechanisms of remembering and forgetting, and why people sometimes falsely remember events that never happened. Cognitive theory and behavioral evidence integrated with data from patient studies and functional brain imaging. Recommended: 1.")
  	course.save
  	course = Course.new(:dept => "PSYCH", :num => "50", :title => "Introduction to Cognitive Neuroscience", :units => 4, :desc => "Survey of topics relating brain activity to cognitive processes and behavior. The course begins with an overview of neurophysiology and techniques to measure brain activity. We then discuss perceptual and motor processes before investigating neural responses related to attention, memory, and cognitive control. The course concludes with a discussion of brain processes related to reward, decision making, and social cognition.")
  	course.save
  	course = Course.new(:dept => "PSYCH", :num => "70", :title => "Introduction to Social Psychology", :units => 4, :desc => "Topics related to the influence of other people on individuals' thoughts, emotions, and behaviors. Factors that affect the way that we perceive ourselves and others; how people influence others; how persuasion happens; what causes us to like, love, help, or hurt others; and how social psychology helps to understand quesions about law, business, and health. Fulfills WIM requirement")
  	course.save

  	dude = User.new(:name => "Michael", :login => "mlipman1")
  	dude.course_ids = [3, 5, 7, 8, 9, 10];
  	dude.save

    gal = User.new(:name => "Molly", :login => "mollz")
    gal.course_ids = [7]
    gal.save

  end

  def down
  	Course.delete_all
  	User.delete_all
  end
end
