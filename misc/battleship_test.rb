# Below is an example for testing user input in minitest

# Taken from https://stackoverflow.com/questions/16948645/how-do-i-test-a-function-with-gets-chomp-in-it

# require 'test/unit'
#
# class View
#   def read_user_input
#     gets.chomp
#   end
# end
#
# class ViewTest < Test::Unit::TestCase
#   def test_read_user_input
#     with_stdin do |user|
#       user.puts "user input"
#       assert_equal(View.new.read_user_input, "user input")
#     end
#   end
#
#   def with_stdin
#     stdin = $stdin             # remember $stdin
#     $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
#     yield write                # pass pipe's "write end" to block
#   ensure
#     write.close                # close pipe
#     $stdin = stdin             # restore $stdin
#   end
# end
