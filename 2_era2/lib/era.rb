# coding: utf-8
class Era
  @@era_names = {
      reiwa: "令和",
      heisei: "平成",
      showa: "昭和"
  }
  @@era_start_date = {
      reiwa: Time.new(2019, 5, 1),
      heisei: Time.new(1989, 1, 8),
      showa: Time.new(1926, 12, 25)
  }

  def convert_from_std(stdin, stdout)
    lines = stdin.readlines
    outputs = convert_lines(lines)
    outputs.each do |line|
      stdout.puts line
    end
  end

  def convert_lines(lines)
    results = []
    lines.each do |line|
      (results.push("error"); next) if line.empty?
      year, month, day = line.split("/").map(&:to_i)
      if year.nil? || month.nil? || day.nil?
        results.push("error")
      else
        begin
          results.push(calc(year, month, day))
        rescue ArgumentError
          results.push("error")
        end
      end
    end
    results
  end


  def calc(year, month, day)
    target_date = Time.new(year, month, day)
    raise ArgumentError if target_date < @@era_start_date[:showa]
    case target_date
    when (@@era_start_date[:showa]...@@era_start_date[:heisei])
      year_str = year_str(year, :showa)
      return @@era_names[:showa] + year_str + "年"
    when (@@era_start_date[:heisei]...@@era_start_date[:reiwa])
      year_str = year_str(year, :heisei)
      return @@era_names[:heisei] + year_str + "年"
    else
      year_str = year_str(year, :reiwa)
      return @@era_names[:reiwa] + year_str + "年"
    end
  end

  def year_str(year, era)
    era_start_year = @@era_start_date[era].year
    (year - era_start_year) == 0 ? "元" : (year - era_start_year + 1).to_s
  end
end
