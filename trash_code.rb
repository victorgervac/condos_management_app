logs = ['88 99 200', '88 99 300', '99 32 100', '33 76 200']
logs.map { |l| l }
sl = logs.map { |l| l.split(', ') }.map { |a| a.split(' ') }.flatten
sl.map { |i| i.split(', ') }
logy = sl.map { |i| i.split(', ').map { |e| e.split(' ') }.flatten }
