# exercise

Programming exercise

This is a simple program which takes a directory, two search terms, and an integer as input and returns a list of text files which contain both search terms within the specified word count of each other.



##Setup/Requirements

Ruby 2.3.1,  which can be obtained @ https://www.ruby-lang.org/en/documentation/installation/

Trollop which can be installed using the command:
`gem install trollop`

Rake which can be installed using the command:
`gem install rake`

Clone the exercise from github
```
git clone https://github.com/jtulick/exercise.git
cd exercise
```

####Unit tests

Unit tests can be run by running the following command at the exercise directory:

`rake`

####Running exercise

From the exercise directory, run the following:

`ruby exercise.rb -d <directory> -f <first search term> -e <second search term> -c <context integer>`

The following command should result in a successful run:

`ruby exercise.rb -d ./tests -f testing -e context -c 20`

The command below should result in a run that does not find any context:

`ruby exercise.rb -d ./tests -f testing -e context -c 1`
