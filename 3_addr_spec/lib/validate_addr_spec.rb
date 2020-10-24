class ValidateAddrSpec
  def validate_addr_spec(stdin, stdout)
    stdin.readlines.each do |line|
      if valid?(line)
        stdout.puts("ok")
      else
        stdout.puts("ng")
      end
    end
  end

  def valid?(email)
    true
  end
end
