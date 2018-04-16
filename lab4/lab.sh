# a) Uzytkownik xxx ma uruchomiony proces xxx (CPU = xxx, MEM = xxx)

# ps aux | awk '{ print "Uzytkownik " $1 " ma uruchomiony proces " $11 " (CPU=" $3 ",MEM=" $4 ")" }'

# b) .../.../.../.../(...) <-- , CPU > 0.1, MEM > 0.1

ps aux | awk '{
  subName = $11;
  sub(".*/","",subName);

  if( $3 > 0.1 && $4 > 0.1) {
    print "Uzytkownik " $1 " ma uruchomiony proces " subName " (CPU=" $3 ",MEM=" $4 ")";
  }
}'

# c) Suma wszystkich CPU, MEM i porównać z top

ps aux | awk '
  BEGIN {
    cpuSum = 0;
    memSum = 0;
  }

  {
    cpuSum += $3;
    memSum += $4;
  }

  END {
    print "CPU TOTAL: " cpuSum;
    print "MEM TOTAL: " memSum;
  }
'

# d) Suma CPU, MEM dla uzytkownika

ps aux | awk '
  {
    if( $1 in cpuTotals ) {
      cpuTotals[$1] = cpuTotals[$1] + $3;
      memTotals[$1] = memTotals[$1] + $4;
    } else {
      cpuTotals[$1] = $3;
      memTotals[$1] = $4;
    }
  }

  END {
    for( user in cpuTotals ) {
      print "Totals for user " user ": " "(CPU=" cpuTotals[user] ", MEM=" memTotals[user] ")";
    }
  }
'

# e) kto maxCPU, kto maxMEM
ps aux | awk '
  {
    if( $1 in cpuTotals ) {
      cpuTotals[$1] = cpuTotals[$1] + $3;
      memTotals[$1] = memTotals[$1] + $4;
    } else {
      cpuTotals[$1] = $3;
      memTotals[$1] = $4;
    }
  }

  END {
    firstUser = 1;
    for( user in cpuTotals ) {
      if( firstUser ) {
        firstUser = 0;

        cpuMax = cpuTotals[user];
        cpuMaxUser = user;

        memMax = memTotals[firsusertUser];
        memMaxUser = user;

      } else {
        if(cpuMax < cpuTotals[user]) {
          cpuMax = cpuTotals[user];
          cpuMaxUser = user;
        }

        if(memMax < memTotals[user]) {
          memMax = memTotals[user];
          memMaxUser = user;
        }
      }
    }

    print "MAX CPU USAGE: " cpuMaxUser " (" cpuMax ")";
    print "MAX MEM USAGE: " memMaxUser " (" memMax ")";
  }
'
