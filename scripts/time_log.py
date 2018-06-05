#!/usr/bin/env python
import sys
from random import randint
import datetime
import re
import fileinput
import string

FILENAME = "/cygdrive/c/Workplace/cygwinx64_pack/cygwin/home/bkatona/scripts/work.log"
'''path to work.log'''

class TicketNumber:
  """docstring for TicketNumber"""
  def __init__(self, namep):
    self.name   = namep
    self.start  = []
    self.end    = []

  def add_start(self, start_ts):
    self.start.append(start_ts)

  def add_end(self, end_ts):
    self.end.append(end_ts)

  def get_time_spent_on_ticket(self):
    tmp = 0
    for a, b in zip(self.start, self.end):
      tmp += (b - a)
    print(self.name + ": " + str(tmp) + " minutes spent on")
    

def refresh_date():
  '''the first stuff to do everyday'''
  now = datetime.datetime.now()
  with open(str(FILENAME), "a") as inF:
    month = str(now.month)
    day   = str(now.day)
    if len(month) == 1:
      month = "0" + month
    if len(day) == 1:
      day   = "0" + day 
    date =  str(now.year) + "." + month  + "." + day + "."
    print("Tomorrow is another day! " + date)
    inF.write(date + "\n")

def log_soe(ticket_number, start_or_end, msg):
  '''the actual work log start or end'''
  now = datetime.datetime.now()
  with open(str(FILENAME), "a") as inF:
    hour = str(now.hour)
    minute = str(now.minute)
    if len(minute) == 1:
      minute = "0" + minute
    if len(hour) == 1:
      hour = "0" + hour
    inF.write(ticket_number + " = " + start_or_end + " --> " + hour + ":" + minute + "\t \" " + msg + "\" ;\n")
    print("iz logged")

def gg_nore():
  '''GG EZ'''
  gg_list = ["Keep it up bro!", "Hell ye!", "gg no re", "gg ez", "Mega LuL", "Toljad neki gec!", "Nem ma kezdtem!", "KV?", "megy ez gec!"]
  random_gg = randint(0, len(gg_list))
  print("")
  print(gg_list[random_gg-1])  

def calculate_ticket_time():
  '''print something,  <--- coma means endl'''
  start = []
  ''' start[]= time_stamp'''
  end   = []
  ''' end[]= time_stamp'''
  ticket_numbers = {}
  '''ticket_numbers[ticket_number] = TicketNumber'''
  for line in fileinput.input(FILENAME, inplace = 1):
    '''search and replace'''
    if not re.search(r"\.", line) and not re.search(r"done", line) and not re.search(r"#", line):
      '''skipp rows containg date and comment'''
      t_n = get_ticket_number(line)
      if ticket_numbers.get(t_n, "oops") == "oops":
        '''oops is a default key to check if ticket exist'''
        ticket_numbers[t_n] = TicketNumber(t_n)
      if re.search(r"s", line):
        ticket_numbers[t_n].add_start(parse_time_stamp(line))
      if re.search(r"e", line):
        ticket_numbers[t_n].add_end(parse_time_stamp(line))
      print line.replace(";", "done"),
    else:
      print line,
  fileinput.close()

  for key in ticket_numbers:
    ticket_numbers.get(key).get_time_spent_on_ticket()

def get_ticket_number(line):
  return re.search(r"\d*", line).group(0)

def show_ticket_time():
  with open(FILENAME, "r") as inF:
    for line in inF:
      if not re.search(".*done.*", line) and not re.search(".*\..*", line):
        print(line)




############################################################
#def test():
#  ticket_numbers = {}
#  t_n = 200
#  ticket_numbers[200] = TicketNumber(t_n)
#  if ticket_numbers.get(t_n, "oops") == "oops":
#    print("entered")
#    ticket_numbers[t_n] = TicketNumber(t_n)
#  else:
#    print("shit")
############################################################

def parse_time_stamp(time_stamp):
  left_side, right_side = time_stamp.split(":", 1)
  list(left_side)
  list(right_side)
  hour = left_side[-2] + left_side[-1]
  minute = right_side[0] + right_side[1]
  '''8237 = e --> 12:52  :        ;'''
  return int(hour)*60 + int(minute)
     
####################################
# ''' MAIN FUNCTION STARTS HERE '''
####################################
if __name__ == "__main__":
  #if str(sys.argv[1]) == "test":
  #  test()
  #else:
  if str(sys.argv[1]) == "cal":
    #calculate_ticket()
    calculate_ticket_time()
  elif str(sys.argv[1]) == "h":
    #calculate_ticket()
    show_ticket_time()
  elif len(sys.argv[1]) == 0:
    refresh_date()
    '''Tomorrow is another day'''
  else:
    log_soe(str(sys.argv[1]), str(sys.argv[2]), str(sys.argv[3]))
    '''ticket number, start or end, optional msg'''
  gg_nore()