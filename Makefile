PYTHON = python3
SCRIPT = http_client.py

URL1 = http://zechuncao.com/teaching/csci4406/testfiles/test1.txt
URL2 = http://zechuncao.com/teaching/csci4406/testfiles/test2.png
URL3 = http://zechuncao.com/teaching/csci4406/testfiles/test3.txt
URL4 = http://zechuncao.com/teaching/csci4406/testfiles/minig.zip
URL5 = http://zechuncao.com/teaching/csci4406/testfiles/inffast.o
URL6 = http://zechuncao.com/teaching/csci4406/testfiles/Makefile
URL7 = http://zechuncao.com/teaching/csci4406/testfiles/25F_CSCI4406_900_Computer_Networks_Syllabus.pdf


OUT1 = test1.txt
OUT2 = test1.png
OUT3 = test1.txt
OUT4 = minigzip
OUT3 = test3.txt
OUT4 = minig.zip
OUT5 = inffast.o 
OUT6 = Makefile_downloaded
OUT7 = 25F_CSCI4406_900_Computer_Networks_Syllabus.pdf

all: test1 test2 test3 minigzip inffast makefile pdf

test1: 
	$(PYTHON) $(SCRIPT) -U $(URL1) -O $(OUT1)
test2: 
	$(PYTHON) $(SCRIPT) -U $(URL2) -O $(OUT2)
test3: 
	$(PYTHON) $(SCRIPT) -U $(URL3) -O $(OUT3)
minigzip: 
	$(PYTHON) $(SCRIPT) -U $(URL4) -O $(OUT4)
	chmod +x $(OUT4)
inffast: 
	$(PYTHON) $(SCRIPT) -U $(URL5) -O $(OUT5)
makefile:
	$(PYTHON) $(SCRIPT) -U $(URL6) -O $(OUT6)
pdf:
	$(PYTHON) $(SCRIPT) -U $(URL6) -O $(OUT6)

clean:
	rm -f $(OUT1) $(OUT2)  $(OUT3) $(OUT4) $(OUT5) $(OUT6) $(OUT7)  

check:
	$(PYTHON) -m py_compile $(SCRIPT)
