PYTHON = python3
SCRIPT = http_client.py
URL = http://zechuncao.com/teaching/csci4406/testfiles/test1.txt
OUTPUT = test1.txt

run:
	$(PYTHON) $(SCRIPT) -u $(URL) -o $(OUTPUT)


clean:
	rm -f $(OUTPUT)

check:
	$(PYTHON) -m py_compile $(SCRIPT)
