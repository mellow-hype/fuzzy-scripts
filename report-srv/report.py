import os
import datetime
curtime = datetime.datetime.now()
output= "report/afl_report.html"
if not os.path.exists(os.path.dirname(output)):
    try:
        os.makedirs(os.path.dirname(output))
    except OSError as exc: # Guard against race condition
        if exc.errno != errno.EEXIST:
            raise
with open("afl_results.txt", "r") as report:
	html = ""
	html += "<html><body><div><p><br>"
	html += str(curtime)
	html += "<br>"
	lines = report.readlines()
	for line in lines:
		html += "<br>"
		html += line
	html += "</p></div></body></html>"
	os.system("rm report/afl_report.html")
	outfile = open(output, "w")
	outfile.write(html)
	outfile.close()
report.close()
