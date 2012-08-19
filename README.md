# Sidir

iOS Simulator directory explorer. This gem is a personal tool intended to make it slightly easier to navigate/manage the iOS Applications directory

## Installation

Add this line to your application's Gemfile:

    gem 'sidir'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidir

## Usage

sidir is a quick, dirty experiment that attempts to use commands with similar semantics to those in common shells to make them easy to remember. The main reason for sidir is because Applications are stored under unique hashs in the Applications directory, which makes this a pain to navigate in finder especially if you have lots of apps installed in your simulators.
    
At which point you'll get a simple prompt

    sidir / >
    
Use help to print available commands

    sidir / > help
          cd <item> - change to directory at <item>
          ls        - list available simulators
          
Once you have cd'd into the context of a simulator you'll have more options available

    sidir /5.1 > help
          cd <item> - open finder at <item>
          cd ..     - move back to simulators
          ls        - list available applications
          rm        - delete the application and all data 
          reset     - clean all paths as if the app is freshly installed

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Todo

- Currently the app it's hard coded to load at 

        ~/Library/Application Support/iPhone Simulator/
    
this obviously is less than ideal

- No tests - this was literally just an experiment
- No docs - see above
