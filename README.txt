
For Mac/Win
python http_client.py -u https://zechuncao.com/teaching/csci4406/testfiles/test1.txt -o test1.txt

For Linux
git clone https://github.com/Charisma-Ricarte/IronOwls_hw2.git (optional)
cd IronOwls_hw2
ls
Check that these files are there (http_client.py  Makefile  README.txt)
python3 http_client.py -u {URL} -o {Outputfile}
cat {Outputfile}

OR



Questions
---------
1. What is the difference between http_client (what you wrote), curl, and wget? Use those tools 
and read about them online before you answer this question.

Ours shows how to download files through sending HTTP/1.0 requests through a socket. 
Ours only supports http:// downloads unlike curl and wget. It would
not be able to handle redirects for any kind of advanced type of feature, this in turn 
would make ours more limited. 


2. Some websites allow only certain browsers (e.g., Firefox) to download content. When an HTTP 
request comes in, those servers check what browser is sending the request. How can you write 
http_client so it is able to download that content despite that check? 
User-Agent can be added in the string to mimick the browser in order to bypass the check. 
Example. The new change will look like this.
f"GET {path} HTTP/1.0\r\nHost: {host}\r\n\r\nUser-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:118.0) Gecko/20100101 Firefox/118.0\r\n"

3. If you were running such a website that needed to restrict its content to a certain browser, 
how can you prevent programs like http_client from downloading the content from your site?

Since checking the User-Agent string wouldn't be enough, I would fortify a stronger defense by using authentication such as requiring token or
cookies, which are tied to the browser sessions. This makes it harder for any client to just slop past my defenses. Another form of defense would be using
CAPTCHAs or javascript challenges which automatic programs are ill equipped to comply and handle. Overall, one must go above and beyond simple
header checks ino order to prove the client is a genuine browser user.
