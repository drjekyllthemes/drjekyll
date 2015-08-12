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
    0.1.0

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
  1..Planet Jekyll's Starter (Minimal) (starter | planetjekyllsstarterminimal) by Gerald Bauer - #white 
  2..Dr Jekyll's Minimal (minimial | drjekyllsminimal) by Gerald Bauer - #white 
  3..Dr Jekyll's Bootstrap (bootstrap | drjekyllsbootstrap) by Gerald Bauer - #bootstrap #scss #white 
  4..Dr Jekyll's Classics Book (classics | drjekyllsclassicsbook) by Gerald Bauer - #books #white 
  5..Poole (poole) by Mark Otto - #poole 
  6..Poole's Hyde (pooleshyde) by Mark Otto - #poole 
  7..Poole's Lanyon (pooleslanyon) by Mark Otto - #poole 
  8..Beautiful Jekyll (beautifuljekyll) by Dean Attali
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



## Install

Just install the gem:

    $ gem install drjekyll


## License

The `drjekyll` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the [wwwmake forum](http://groups.google.com/group/wwwmake).
Thanks!

