#!/usr/bin/env python

import sys
import re
import os
###########################
#COULD BE USEFUL SOMETIMES#
###################################################################
# argv[1] ticket_number
# argv[2] logfile_name
# argv[3] regex_stuff
#file_path = "/cygdrive/e/stuffs/HELP/ticket_helpers/"
## ticket number is enough
#folder    = file_path + "RADNAV3-" + str(sys.argv[1])
#filename  = folder + "/" + str(sys.argv[2]) + ".txt"
#reg_stuff = str(sys.argv[3])
####################################################################

#good for reg_stuff
################################################################
#for i, filename in enumerate(list_of_files):
#  outFile.write("-== Results in " + filename + " are ==-")
#  with open(str(filename), "r") as inF:
#    for line in inF:
#      line_number += 1
#      if pattern in line:
#        outFile.write(str(line_number) + ": " + line)
#  outFile.write("---- End of " + filename + " ----")
################################################################
#  for i, filename in enumerate(list_of_files):
#    outFile.write("-== Results in " + filename + " are ==-\n")
#    for i, line in enumerate(open(filename)):
#      for match in re.finditer(pattern, line):
#        outFile.write(str(i+1) + ": " + line)
#        #print 'Found on line %s: %s' % (i+1, match.groups())
#    outFile.write("---- End of " + filename + " ----\n")
#  outFile.close()  


#init phase

def remove_aids_fromlog(regex, folder, list_of_files):
  #folder += "/adb_log.txt"
  for i, filename in enumerate(list_of_files):
    with open(filename,"r") as inF:
      result = folder + "/" + "removed_" + filename + ".txt"
      with open(result,"wb") as outF: 
        for line in inF:
          if not re.search(".*" + regex + ".*", line):
            outF.write(line)
  print("--====--\n--==== move {} files to tmp folder ====--\n--====--", list_of_files)
  for i, filename in enumerate(list_of_files):
    os.rename(folder + "/" + filename, folder + "/tmp/" + filename)



# MAIN AIDS STARTS HERE
if __name__ == '__main__':
  file_path="/cygdrive/e/stuffs/HELP/ticket_helpers/"
  if str(sys.argv[4]) == "c":
    folder=file_path + "_China/" + str(sys.argv[1]) + "-RADNAV"
  else:
    folder=file_path + str(sys.argv[1]) + "-RADNAV3"

  result_file = folder + "/"
  pattern = "navngo"
  
  reg_stuff = "(" + str(sys.argv[3]) + ")"
  pattern = re.compile(reg_stuff)
  print reg_stuff
  result_file += "result.txt"

  list_of_files = str(sys.argv[2]).split("\n")
  if "grep_param.txt" in list_of_files:
    list_of_files.remove("grep_param.txt")
  if "result.txt" in list_of_files:
    list_of_files.remove("result.txt")
  print "list of files"
  print list_of_files

  """remove aids should be sys.argv[5] and china"""
  if str(sys.argv[5]) == "remove" or str(sys.argv[4]) == "remove":
    print("remove aids....")
    remove_aids_fromlog(str(sys.argv[3]), folder, list_of_files)
  else:     
    #log process
    outFile = open(result_file,"w+")    
    print "regex: " + reg_stuff
    
    for i, filename in enumerate(list_of_files):
      outFile.write("-== Results for" + reg_stuff + " in " + filename + " are ==-\n")
      with open(filename) as inF:
        j = 0
        for line in inF:
          j += 1
          if re.search(reg_stuff, line):
            outFile.write(str(j) + ": " + line)
      outFile.write("---- End of " + filename + " ----\n\n\n\n")
    outFile.close()  
    #      #for j, line in enumerate(open(filename)):
        #if re.search(".*" + reg_stuff + ".*", line):
        #  outFile.write(str(j+1) + ": " + line)
        #for match in re.finditer(pattern, line):
         # outFile.write(str(j+1) + ": " + line)
          #print 'Found on line %s: %s' % (i+1, match.groups())