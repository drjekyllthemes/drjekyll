# drj/drjekyll - the missing static site theme package manager

jekyll command line tool

* home  :: [github.com/drjekyllthemes/drjekyll](https://github.com/drjekyllthemes/drjekyll)
* bugs  :: [github.com/drjekyllthemes/drjekyll/issues](https://github.com/drjekyllthemes/drjekyll/issues)
* gem   :: [rubygems.org/gems/drjekyll](https://rubygems.org/gems/drjekyll)
* rdoc  :: [rubydoc.info/gems/drjekyll](http://rubydoc.info/gems/drjekyll)
* forum :: [wwwmake](http://groups.google.com/group/wwwmake)


## Usage

The drjekyll gem includes a command line tool that
lets you manage static site theme packages.
Try:

```
$ drjekyll --help      # or
$ drj -h
```

Resulting in:

```
NAME
    drjekyll/drj - jekyll command line tool .:. the missing static site theme package manager

SYNOPSIS
    drjekyll/drj [global options] command [command options] [arguments...]

VERSION
    1.0.0

GLOBAL OPTIONS
    --help    - Show this message
    --verbose - (Debug) Show debug messages
    --version - Display the program version

COMMANDS
    list, ls, l             - List themes
    new, n                  - Download 'n' setup (unzip/unpack) theme
    help                    - Shows a list of commands or help for one command

    download, dl, d, get, g - (Debug) Step 1: Download theme; .zip archive saved in working folder (./)
    unzip, setup, s         - (Debug) Step 2: Setup (unzip/unpack) theme; uses .zip archive in working folder (./)
```


### Commands

[List Themes](#list-themes-command---list-ls-l) •
[New Theme](#new-theme-command---new-n)


#### List Themes Command - `list`, `ls`, `l`

Use:

```
$ drjekyll list    # or
$ drjekyll ls      # or
$ drjekyll l       # or
$ drj l
```

Resulting in:

```
  1..Henry's Hello, Jekyll! (hello | hellojekyll | henryshellojekyll) by Gerald Bauer - #white #starter
  2..Henry's Starter (starter | henrysstarter) by Gerald Bauer - #white #starter
  3..Henry's Minimal (minimial | henrysminimal) by Gerald Bauer - #white #minimal #starter
  4..Henry's Bootstrap (bootstrap | henrysbootstrap) by Gerald Bauer - #bootstrap #scss #white #starter
  5..Henry's Classics Book (classics | henrysclassicsbook) by Gerald Bauer - #books #white
  6..Poole (poole) by Mark Otto - #poole
  7..Poole's Hyde (hyde | pooleshyde) by Mark Otto - #poole
  8..Poole's Lanyon (lanyon | pooleslanyon) by Mark Otto - #poole
  9..Beautiful Jekyll (beautifuljekyll) by Dean Attali
...
```

Note: You can filter by name or tags; just add the query e.g.:

```
$ drjekyll list resume    # or
$ drjkeyll ls resume      # or
$ drjkeyll l resume       # or
$ drj l resume
```

Resulting in:

```
 68..Resume Cards (resumecards) by Elle Kasai - #resume
104..iCard Resume (icardresume) by Dong Liang - #resume
109..Resume (resume) by Joel Glovier - #resume
```


#### New Theme Command - `new`, `n`

To download and install (unzip/unpack) a theme archive use:

```
$ drjekyll new starter    # or
$ drjekyll n starter      # or
$ drj n starter
```

This will download the `starter.zip` to your working folder and
unzip the archive into the `./starter` folder.


**More Examples**

To download and install (unzip/unpack):

```
  7..Poole's Lanyon (lanyon | pooleslanyon) by Mark Otto - #poole
```

Use:

```
$ drjekyll new lanyon     # or
$ drjekyll n lanyon       # or
$ drj      n lanyon
```

To download and install (unzip/unpack):

```
  8..Beautiful Jekyll (beautifuljekyll) by Dean Attali
```

Use:

```
$ drjekyll new beautifuljekyll   # or
$ drjekyll n beautifuljekyll     # or
$ drj      n beautifuljekyll
```

And so on and so forth.



**More Themes**

See the [Dr. Jekyll's Themes](https://drjekyllthemes.github.io) directory.


**More Quick Starter Wizard Scripts**

See the [Mr. Hyde's Scripts](https://github.com/mrhydescripts/scripts) library.


## Install

Just install the gem:

    $ gem install drjekyll


## License

The `drjekyll` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the [wwwmake forum](http://groups.google.com/group/wwwmake).
Thanks!
