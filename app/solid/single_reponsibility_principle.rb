### Definitions
# "One class should always be responsible for doing only one thing"
# "Class should have only one reason to change"
# "Class should have responsibility towards only one client/user"

# EXAMPLE 1

# Class has more than one responsibility
class Course
  def enroll(student); end
  def pay; end
  def add_lesson(lesson); end
end

# Applied SRP would look like this
class Course
  def enroll(student)
    Enrollment.new.enroll(student, self)
  end
  def pay
    PaymentService.new.pay(self)
  end
  def add_to_course(lesson)
    lesson.add_to_course(self)
end

class Enrollment
  def enroll(student, course); end
end

class PaymentService
  def pay(course); end
end

class Lesson
  def add_to_course(course); end
end

# EXAMPLE 2 

# Violation of the Single Responsibility Principle in Ruby
# Class is responsible for generating and then sending the report
class FinancialReportMailer
  def initialize(transactions, account)
    @transactions = transactions
    @account = account
    @report = ''
  end

  def generate_report!
    @report = @transactions.map {
      |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
    }.join("\n")
  end

  def send_report
    Mailer.deliver(
      from: 'reporter@example.com',
      to: @account.email,
      subject: 'your report',
      body: @report
    )
  end
end

mailer = FinancialReportMailer.new(transactions, account)
mailer.generate_report!
mailer.send_report

# Correct use of the Single Responsibility Principle in Ruby
class FinancialReportMailer
  def initialize(report, account)
    @report = report
    @account = account
  end

  def deliver
    Mailer.deliver(
      from: 'reporter@example.com',
      to: @account.email,
      subject: 'Financial report',
      body: @report
    )
  end
end

class FinancialReportGenerator
  def initialize(transactions)
    @transactions = transactions
  end

  def generate
    @transactions.map { |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
    }.join("\n")
  end
end

report = FinancialReportGenerator.new(transactions).generate
FinancialReportMailer.new(report, account).deliver
