PYTHON = python3
SCRIPT = http_client.py

URL1 = https://zechuncao.com/teaching/csci4406/testfiles/test1.txt
URL2 = https://zechuncao.com/teaching/csci4406/testfiles/test2.png
URL3 = https://zechuncao.com/teaching/csci4406/testfiles/test3.txt
URL4 = https://zechuncao.com/teaching/csci4406/testfiles/minigzip
URL5 = https://zechuncao.com/teaching/csci4406/testfiles/inffast.o
URL6 = https://zechuncao.com/teaching/csci4406/testfiles/Makefile
URL7 = https://zechuncao.com/teaching/csci4406/testfiles/25F_CSCI4406_900_Computer_Networks_Syllabus.pdf

OUT1 = test1.txt
OUT2 = test2.png
OUT3 = test3.txt
OUT4 = minigzip
OUT5 = inffast.o 
OUT6 = Makefile_downloaded
OUT7 = 25F_CSCI4406_900_Computer_Networks_Syllabus.pdf

all: test1 test2 test3 minigzip inffast makefile pdf

test1: 
	$(PYTHON) $(SCRIPT) -u $(URL1) -o $(OUT1)

test2: 
	$(PYTHON) $(SCRIPT) -u $(URL2) -o $(OUT2)

test3: 
	$(PYTHON) $(SCRIPT) -u $(URL3) -o $(OUT3)

minigzip: 
	$(PYTHON) $(SCRIPT) -u $(URL4) -o $(OUT4)
	chmod +x $(OUT4)

inffast: 
	$(PYTHON) $(SCRIPT) -u $(URL5) -o $(OUT5)

makefile:
	$(PYTHON) $(SCRIPT) -u $(URL6) -o $(OUT6)

pdf:
	$(PYTHON) $(SCRIPT) -u $(URL7) -o $(OUT7)

clean:
	rm -f $(OUT1) $(OUT2) $(OUT3) $(OUT4) $(OUT5) $(OUT6) $(OUT7)

check:
	$(PYTHON) -m py_compile $(SCRIPT)
