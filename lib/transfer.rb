require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize sender, receiver, amount, status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @transaction_count = 0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @transaction_count == 0 && self.valid? && @sender.balance > @amount
      @transaction_count += 1
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end
