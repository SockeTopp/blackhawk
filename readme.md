# BlackHawk ![alt text](src/common/images/blackhawk_logo_color_xxsmall.png "blackhawk_logo_color")

BlackHawk is a simple web-based search tool that lets user analyze the contents of pdf files on web pages fast and efficient without any fuzz. 

### Story
The idea of a web-based search tool emerged as I was studying for my exam in Compiler Construction at University. As some of you may know the field of compiler construction is quite extensive and covers a lot of different topics such as lexical analysis, intermediate representation, code optimization, parsers and code generation to name a few. 

At my University most of the lecture slides are uploaded as Portable Document Format (PDF) files on a course website so that students can take part of the core content in every course. The number of slides varies but usually yields from 1-3 different pdf files for each topic. Needless to say you spend a lot of time reading slides and course literature in order to study for the final exam. 

As I was typing Ctrl + F... in a pdf file to see if what I was looking for existed in that pdf file, the idea suddenly hit me. What if there was some kind of tool that lets you scan all pdfs file on a website and lets you know which once that are of your interest? That was the main idea here. So right after the exam period I started coding.

### Getting Started
##### Prerequisites
I am fairly certain that this works on Linux since it already got bash. If you miss pdftotext or wget, simply install with apt-get.
###### Windows
You need to download [Git](https://git-scm.com/), [Xpdf tools](https://www.xpdfreader.com/download.html) and [wget](https://eternallybored.org/misc/wget/). 

1. Install Git for Windows
2. Extract Xpdf tools and wget zip files. 
3. Add pdftotext.exe and wget.exe in C:\Program Files\Git\mingw64\bin.
4. Now you're ready to roll! 


##### How to use
Run the command following this pattern: blackhawk.sh [URL] [KEYWOERD]

Example:
```
$./blackhawk.sh https://www.ida.liu.se/~TDDB44/lectures/lectures.en.shtml JIT
....
JIT was found in the following pdf files on the website:
13-Interpreters
```

### How it works
* BlackHawk simply download all the pdf files given an URL. 
* Converts each pdf file to a txt file.
* Then scans each txt file for the given keyword and return the result.

##### Considerations
I choose Bash because I wanted this to be a fast and fun project. Bash is a great scripting languages the carries with a lot of efficient tools that came handy in this project.
I might consider rewriting this in C++ in the future if this project would ever develop to something bigger than just a side project. 

### Idea behind the name
Eagles, Hawks and Helicopter... fly high in the sky giving them an excellent overview over the distant fields and landscapes. In this metafor pdf files are the landscape and the search tool is the flying machine (haha) giving you a great overview on which pdf files are of interest. 

### Built With
Beer beer ber bash bash bash. (Swedish pun).

### Contributing

Please read the WIKI page for details on our code of conduct (non so far...), and the process for submitting pull requests to us (not considered that yet..). However, fork it and contribute. I have written down some thoughts of improvements.

### Authors
* **Sokrates Lamprou** - *Initial work* - [Socketopp](https://github.com/Socketopp)

### Acknowledgments

Thanks to all people out there that makes programming a little less painful (Because Bash is such an obvious and straight forward language..)

* [pvandenberk @ superuser.com](https://superuser.com/questions/272265/getting-curl-to-output-http-status-code)
* [Dennis Williamson @ stackoverflow.com ](https://stackoverflow.com/questions/3183444/check-for-valid-link-url)
* [jimmij @ unix.stackexchange.com](https://unix.stackexchange.com/questions/183223/loop-over-files-returned-from-find)
* [regextester for allowing me to try regex ](https://www.regextester.com)
* [regexr was also very nice webtool](https://www.regexr.com/)
* [bstpierre @ stackoverflow.com](https://stackoverflow.com/questions/3236871/how-to-return-a-string-value-from-a-bash-function/3243034#3243034)
* [Coding District @ stackoverflow.com](https://stackoverflow.com/questions/4111475/how-to-do-a-logical-or-operation-in-shell-scripting)
* [duffbeer703 @ serverfault.com](https://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty)
* [stema @ stackoverflow.com](https://stackoverflow.com/questions/8374742/regex-last-occurrence)
* [Andy @ stackoverflow.com](https://stackoverflow.com/questions/19776979/regex-get-all-characters-after-last-slash-in-url)
* [Fırat KÜÇÜK @ stackoverflow.com](https://stackoverflow.com/questions/3362920/get-just-the-filename-from-a-path-in-a-bash-script)
* [Inian @ stackoverflow.com](https://stackoverflow.com/questions/50173113/loop-through-all-the-files-with-txt-extension-in-bash)
* [tldp.org too long didnot...joking The linux documentation project was a great aide.](http://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x7969.htm)
* [peterph @ unix.stackexchange.com](https://unix.stackexchange.com/questions/68846/how-do-i-remove-all-sub-directories-from-within-a-directory
)
* [Vivek Gite @cyberciti.biz](https://www.cyberciti.biz/faq/finding-bash-shell-array-length-elements/)
* [Countless people posting here @stackoverflow.com](https://stackoverflow.com/questions/10582763/how-to-return-an-array-in-bash-without-using-globals)
* [Aaron Digulla @stackoverflow.com](https://stackoverflow.com/questions/29889074/how-to-wait-for-first-command-to-finish/29890106#29890106)

This really makes me feel like I should contribute more to Stackoverflow. Share the knowledge people!
# Peace!
