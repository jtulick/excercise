# exercise

Programming exercise

This is a simple program which takes a directory, two search terms, and an integer as input and returns a list of text files which contain both search terms within the specified word count of each other.



##Setup/Requirements

Ruby 2.3.1,  which can be obtained @ https://www.ruby-lang.org/en/documentation/installation/

Trollop which can be installed using the command:
`gem install trollop`

Clone the exercise from github
```
git clone https://github.com/jtulick/exercise.git
cd exercise
```



####Running exercise

From the exercise directory, run the following:

`ruby exercise.rb -d <directory> -f <first search term> -e <second search term> -c <context integer>`
