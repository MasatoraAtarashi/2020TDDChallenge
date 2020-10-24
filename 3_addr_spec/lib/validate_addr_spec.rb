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
    # @ is only once
    splited = email.split("@")
    return false if split.length != 2

    local, domain = splited
    # Domain part assertion
    # D1
    return false if domain.match?(/[\w\d!\#$%&'\*\+-\/=?^_`{|}~\.]+/)
    # D2
    return false if domain[0]
    # D3
    return false if domain[-1]
    # D4
    # D5

    # Local part assertion
    # L1

  end
end
