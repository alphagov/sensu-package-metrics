Then(/^the stdout should be JSON with:$/) do |table|
  output = all_commands.map { |c| c.output }.join("\n")
  json = JSON.parse(output)
  table.raw.each do |row|
    expected = Integer(row[1]) rescue row[1]
    expect(json.fetch(row[0])).to eql expected
  end
end
