#!/usr/bin/env ruby

require 'fileutils'

expression = nil

script_start = while expression != "EXIT"
    puts "Do some math! Type EXIT to terminate calculator."
    expression = gets.chomp
    expression == "EXIT" ? break : nil

    # If the expression contains anything other than numbers or valid operators
    # Alert the user
    if expression.match(/[^ 0-9*\/+-]/)
      puts "Invalid characters detected"
      break
    end

    # Strip invalid characters
    expression = expression.gsub(/[^0-9*\/+-]/, "")

    # Expression must contain at least one valid operator
    if expression.match?(/[*\/+-]/) == false
      puts "Expression must contain a valid operator: * / + -"
      break
    end

    # If the expression starts with an operator other than the minus sign, return to start
    if expression.start_with? /[*\/+-]/
      puts "Don't start expressions with operators!"
      break
    end

    # Create one space between integers and valid operators
    expression = expression.gsub(/[*\/+-]/) {|char| " #{char} "}
    # If the expression contains "*"
    while expression.match(/[*]/)
      a = expression.split

      # get index of mult
      i = a.index("*")

      # multiply the two numbers on either side of the index
      product = a[i - 1].to_i * a[i + 1].to_i

      # insert the product into the expression array
      a.insert(i, product.to_s)

      # delete operator
      a.delete_at(i + 1)

      # delete number to the right of the operator
      a.delete_at(i + 1)

      # delete number to the left of the operator
      a.delete_at(i - 1)

      # form a new expression string
      expression = a.join(" ")
    end

    # If the expression contains "/"
    while expression.match(/[\/]/)
      a = expression.split

      # get index of divider
      i = a.index("/")

      # divide the two numbers on either side of the index
      quotient = a[i - 1].to_f / a[i + 1].to_f

      # insert the product into the expression array
      a.insert(i, quotient.to_s)

      # delete operator
      a.delete_at(i + 1)

      # delete number to the right of the operator
      a.delete_at(i + 1)

      # delete number to the left of the operator
      a.delete_at(i - 1)

      # form a new expression string
      expression = a.join(" ")
    end

    # If the expression contains "+"
    while expression.match(/[+]/)
      a = expression.split

      # get index of plus sign
      i = a.index("+")

      # add the two numbers on either side of the index
      sum = a[i - 1].to_i + a[i + 1].to_i

      # insert the sum into the expression array
      a.insert(i, sum.to_s)

      # delete operator
      a.delete_at(i + 1)

      # delete number to the right of the operator
      a.delete_at(i + 1)

      # delete number to the left of the operator
      a.delete_at(i - 1)

      # form a new expression string
      expression = a.join(" ")
    end

    # If the expression contains "-"
    while expression.match(/[-]/)
      (expression.start_with?("-") && (expression.split.count == 1)) ? break : nil

      a = expression.split

      # get index of minus sign
      i = a.index("-")

      # subtract the two numbers on either side of the index
      difference = a[i - 1].to_i - a[i + 1].to_i

      # insert the difference into the expression array
      a.insert(i, difference.to_s)

      # delete operator
      a.delete_at(i + 1)

      # delete number to the right of the operator
      a.delete_at(i + 1)

      # delete number to the left of the operator
      a.delete_at(i - 1)

      # form a new expression string
      expression = a.join(" ")
    end

    puts expression
  end
