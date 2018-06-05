https://docs.python.org/2/library/subprocess.html

cmd = "sudo -n apt-get -yf install python-tk python-imaging-tk python-imaging"
subprocess.check_call(cmd, shell=1, stderr=subprocess.PIPE)

cmd = ["adb", "logcat", "-v", "time", "-f", log_file_path]
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)