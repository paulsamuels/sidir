# Sidir

iOS Simulator directory explorer. This gem is a personal tool intended to make it slightly easier to navigate/manage the iOS Applications directory

## Installation

Install it yourself as:

    $ gem install sidir

## Usage

sidir is a quick, dirty experiment that attempts to use commands with similar semantics to those in common shells to add contextual navigation of the iOS sims directories. The main reason for sidir is because Applications are stored under unique hashes in the Applications directory, which makes this a pain to navigate in finder, especially if you have lots of apps installed in your simulators.
    
Start at your terminal with

    sidir
    
At which point you'll get a simple prompt

    sidir / >
    
Use help to print available commands

    sidir / > help
          cd <item> - change to directory at <item>
          ls        - list available simulators
          show      - open Finder here
          exit      - exit sidir
          
Once you have cd'd into the context of a simulator you'll have more options available

    sidir /5.1 > help
          cd    <item> - open finder at <item>
          cd    ..     - move back to simulators
          ls           - list available applications
          show         - open Finder here
          rm    <item> - delete the application <item> and all associated data 
          reset <item> - clean all paths in <item> as if the app is freshly installed
          exit         - exit sidir
          
An example session might look something like (horizontal space added for clarity)

    sidir
    
    sidir / > ls
    4.3.2
    5.0
    5.1
    
    sidir / > cd 5.1
    
    sidir /5.1 > ls
    Animations
    Lines
    Testing
    hello_world
    
    sidir /5.1 > reset Testing 
    /Users/paul/Library/Application Support/iPhone Simulator/5.1/Applications/927BF49B-95ED-44AF-BC98-A8FB6E49571A
    cd Library/Caches
    rm -r Snapshots
    cd -
    
    sidir /5.1 > rm Testing 
    All data associated with "Testing" will be permanently deleted.
    Are you sure?[yn]
    y
    Testing deleted
    
    sidir /5.1 > exit

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
