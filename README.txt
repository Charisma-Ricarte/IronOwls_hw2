GET /path/to/file HTTP/1.0\r\n
Host: hostname\r\n
User-Agent: http_client/1.0\r\n
Connection: close\r\n
\r\n


chmod +x http_client.py

Questions
---------
1. What is the difference between http_client (what you wrote), curl, and wget? Use those tools 
and read about them online before you answer this question.


2. Some websites allow only certain browsers (e.g., Firefox) to download content. When an HTTP 
request comes in, those servers check what browser is sending the request. How can you write 
http_client so it is able to download that content despite that check? 


3. If you were running such a website that needed to restrict its content to a certain browser, 
how can you prevent programs like http_client from downloading the content from your site?

Since checking the User-Agent string wouldn't be enough, I would fortify a stronger defense by using authentication such as requiring token or
cookies, which are tied to the browser sessions. This makes it harder for any client to just slop past my defenses. Another form of defense would be using
CAPTCHAs or javascript challenges which automatic programs are ill equipped to comply and handle. Overall, one must go above and beyond simple
header checks ino order to prove the client is a genuine browser user.