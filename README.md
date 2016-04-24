# Markdown Notes

## Dependencies

- [Pandoc](https://github.com/jgm/pandoc)

## Uses

I created this to easily make class notes in Markdown, and export them to individual PDFs, as well as create one large PDF with all notes

## Installation

1. Clone repo into a permanent location
1. `cd` into repo
1. `chmod a+x init_notes.sh`

## Initialization

### Option 1: Create a `notes` directory

1. Navigate to the directory in which you want to store the notes directory (i.e. your class folder)
1. `$PATH_TO_REPO/init_notes.sh`

### Option 2: Initialize an existing directory as a `notes` directory

Supply the path to the folder as an argument to the script, i.e. `$PATH_TO_REPO/init_notes.sh ~/Desktop/sample_notes`

This also works with `.`, so you can do the following:

```
cd ~/Desktop/sample_notes
$PATH_TO_REPO/init_notes.sh .
```

---

This will create the following structure:

```
.
└── notes
    ├── img
    │   └── index
    └── makefile -> /Users/evansalter/dev/notes/makefile
```

## Usage

Once you have initialized a `notes` directory using `init_notes.sh`, you can begin writing notes:

- Create notes in `notes` directory
- Place images in the `img` directory
- To create PDFs, run `make` in the `notes` directory.  This will create a `PDFs` directory (if it doesn't exist).
	- Individual PDFs for each `.md` file in `notes` will be created, as well as `all_notes.pdf` which is a concatenation of each `.md` file with a table of contents.

## Extras

I have the following shell function sourced in my shell to easily create a new Markdown file with the current date as the filename and the first line of the file:

```
note() {
	FILE="`date +%Y-%m-%d`.md"
	DATE="`date +"%A, %B %d, %Y"`"
	if [ -f $FILE ];
	then
		$EDITOR $FILE
	else
		echo "# $DATE" >> $FILE
		$EDITOR $FILE
	fi
}
```

Execute by running `note`.  This will create a file called `2016-01-05.md`, with the contents:

```
# Tuesday, January 05, 2016
```

If a file named `2016-01-05.md` already exists, it will open it in your default editor.
