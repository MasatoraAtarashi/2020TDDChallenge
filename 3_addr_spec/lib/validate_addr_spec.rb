class ValidateAddrSpec
  def validate_addr_spec(stdin, stdout)
    stdin.readlines.each do |line|
      if valid?(line.chomp)
        stdout.puts("ok")
      else
        stdout.puts("ng")
      end
    end
  end

  def valid?(email)
    # @ is only once
    splited = email.split("@")
    return false if splited.length != 2

    local, domain = splited
    # Domain part assertion
    # D1 && D5
    return false unless /[\w\d!\#$%&'\*\+-\/=?^_`{|}~\.]+/ === domain
    # D2
    return false if domain[0] == "."
    # D3
    return false if domain[-1] == "."
    # D4
    return false if /\.\./ === domain

    # Local part assertion
    # L1
    dotatom?(local) || quotedstr?(local)
  end

  def dotatom?(local)
    return false unless /[\w\d!\#$%&'\*\+-\/=?^_`{|}~\.]+/ === local
    return false if local[0] == "."
    true
  end

  def quotedstr?(local)
    false
  end

end
