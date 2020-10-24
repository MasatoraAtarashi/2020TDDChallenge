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
    # @が一個もない
    return false unless email.include?("@")
    splited = email.split("@")
    domain = splited[-1]
    local = splited[0...-1].join("@")

    # Domain part assertion
    # D1 && D5
    return false unless /^[\w\d!\#$%&'\*\+-\/=\?\^_`{|}~\.]+$/ === domain
    # D2
    return false if domain[0] == "."
    # D3
    return false if domain[-1] == "."
    # D4
    return false if /\.\./ === domain

    # Local part assertion
    # L1
    # if /^"
    puts local
    dotatom?(local) || quotedstr?(local)
  end

  def dotatom?(local)
    return false unless /^[\w\d!\#$%&'\*\+-\/=\?\^_`{|}~\.]+$/ === local
    return false if local[0] == "."
    return false if local[-1] == "."
    return false if /\.\./ === local
    true
  end

  def quotedstr?(local)
    # LQ1 && LQ2
    return true if local == ""
    return false unless /^"[\w\d!\#$%&'\*\+-\/=\?\^_`{|}~\(\),\.:;<>@\[\]"\\]+"$/ === local
    true
  end

end
