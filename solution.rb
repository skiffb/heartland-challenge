require 'date'

def solution(s)
  photos = s.split("\n")
  split_w_index = photos.each_with_index.map { |p, i| p.split(", ").append(i)}
  sorted_by_city = split_w_index.group_by { |s| s[1] }.values.map { |v| v.sort_by { |p| DateTime.parse(p[2])}}
  named_w_index = sorted_by_city.map do |p|
    p.each_with_index.map { |s, i| ["#{s[1]}#{number_string(i, p.length)}#{File.extname(s[0])}", s[3]]}
  end.flatten(1)

  return named_w_index.sort_by { |n| n[1] }.map { |s| s[0]}.join("\n")
end

def number_string(i, length)
  n = length.to_s.length
  m = i + 1
  return "%.#{n}i" % m
end

print(solution("photo.jpg, Krakow, 2013-09-05 14:08:15
  Mike.png, London, 2015-06-20 15:13:22
  myFriends.png, Krakow, 2013-09-05 14:07:13
  Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
  pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
  BOB.jpg, London, 2015-08-05 00:02:03
  notredame.png, Florianopolis, 2015-09-01 12:00:00
  me.jpg, Krakow, 2013-09-06 15:40:22
  a.png, Krakow, 2016-02-13 13:33:50
  b.jpg, Krakow, 2016-01-02 15:12:22
  c.jpg, Krakow, 2016-01-02 14:34:30
  d.jpg, Krakow, 2016-01-02 15:15:01
  e.png, Krakow, 2016-01-02 09:49:09
  f.png, Krakow, 2016-01-02 10:55:32
  g.jpg, Krakow, 2016-02-29 22:13:11"))