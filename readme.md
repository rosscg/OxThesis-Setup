# Oxford Thesis Template Suite

Set up Latex with Mendeley integration and automatic online backup. Latex will automatically compile when a change is detected, thus streamlining the editing process.

-----------------
## Setup

### Install Software

- Install [Mendeley](https://www.mendeley.com) (reference manager)
- Install Latex. Tested with [MacTeX (Mac)](http://www.tug.org/mactex/) and [MiKTeX (Windows)](https://miktex.org/download)
- Install [Atom](http://atom.io) (text editor)
  - In Atom, install packages: (Mac: Atom -> Preferences -> Install, Windows: File -> Settings -> Install)
    - language-latex
    - autocomplete-latex-cite
  - Optional Atom packages:
    - autocomplete-paths
    - highlight-selected
    - Zen
    - typewriter
    - wordcount or latex-wordcount
  - It is also recommended to set the theme to One Dark. (Atom/File -> Preferences/Settings -> Themes)
- Install a pdf viewer. These allow auto-refreshing when the source file is changed.
  - (Mac) Install [Skim](https://skim-app.sourceforge.io/)
      - Remove the second line from latexmkrc file (once you download this folder below).
      - (Optional) In Skim, CMD-SHIFT-clicking on a word will direct the cursor to that line in Atom. In Skim, set **Preferences -> Sync -> Preset = Atom**.
  - (Windows) Install pdf viewer [Ghostscript](www.ghostscript.com).
      - Remove the first line from latexmkrc file (once you download this folder below).
  - (Windows) Install [ActiveState Perl](https://www.activestate.com/products/activeperl/downloads/) or Strawberry Perl. (TODO: to be tested)


### Backup & Version Control

If desired, this script will automatically commit changes to a git repository and push to an online repository. This is recommended to maintain a versioned, online backup.

- Install [Git](https://git-scm.com/download).
  - (Windows) During the Git installation, you must choose the setting 'Git from the command line ... ' on the 'Adjusting your PATH environment' section.
- Create an account with [Github](https://github.com).
- Create a new private repository (substituting your Github USERNAME):
  - `curl -u 'USERNAME' https://api.github.com/user/repos -d '{"name":"oxfordthesis", "private":"true"}'`
- Copy this folder into your repository:
  - (Mac) Open a terminal window and navigate to the desktop: `cd ~/Desktop`
  - (Windows) Open command prompt and navigate to the desktop: `cd c:\Users\USERNAME\Desktop`
  - Run the following commands, substituting your Github USERNAME:
  - `git clone --bare https://github.com/rosscg/OxThesis-Setup.git`
  - `cd OxThesis-Setup.git`
  - `git push --mirror https://github.com/USERNAME/oxfordthesis.git`
  - `cd ..`
  - (Mac) `rm -rf OxThesis-Setup.git`
  - (Windows) `rmdir OxThesis-Setup.git /s /q`
  - `cd oxfordthesis`
- Open the `runThesisMac.sh` or `runThesisWin.bat` file and uncomment the three git lines (remove the preceding hash or colons).
- Run the following commands in terminal/command prompt, with your details:
  - `git config --global user.name "YOUR NAME"`
  - `git config --global user.email you@example.com`

### (alternative) No Backup

- If not using Github as described above, simply download this repository by using the 'Clone or download' button, and choosing to download as zip. Unzip to your desktop and navigate to it:
  - (Mac) Open a terminal window and navigate to the desktop: `cd ~/Desktop/OxThesis-Setup-master`
  - (Windows) Open command prompt and navigate to the desktop: `cd c:\Users\USERNAME\Desktop\OxThesis-Setup-master`


### Mendeley Integration

This should work with other reference managers but these haven't been tested.

- Set Mendeley to automatically create a Bibtex file for 'whole library' (or folder group if relevant) at an appropriate directory (i.e. `/YOUR-MENDELEY-LIBRARY-DIR/_bibtex/`). The filename should be `library.bib`.
- (Mac) Create a symlink of the Mendeley folder containing your bib file in its place:
  - `rm -rf bib`
  - `ln -s /YOUR-MENDELEY-LIBRARY-DIR/_bibtex/ .`
    - (Drag the `_bibtex` folder into the terminal window rather than typing the path to autocomplete.)
  - `mv _bibtex bib`
- (Windows) For symlinks, use mklink. Documentation TBC. In the meantime, simply set Mendeley to output the library.bib into /bib/ directory.


### Configuration

- Move the thesis folder somewhere appropriate and rename if desired.
- Create a shortcut/alias to the runThesisMac.sh or runThesisWin.bat where convenient. You can delete the  file not relevant to your OS.
- (Mac) Make the startup script executable with the terminal command: `chmod a+x runThesisMac.sh`
- Edit latexmkrc file: remove the second line if using a Mac, remove the first line if using Windows.
- You may delete this readme.md from your folder.

-----------------

## Running the Software
Simply run the shortcut to the runThesis file.

This will open a terminal window which opens Atom, builds the pdf file, and displays it in the pdf viewer. Any changes made in Atom will be detected by the terminal window, which will rebuild the pdf file. The pdf viewer should then refresh and show these changes automatically.

To finish a session, close Atom and the pdf viewer. In the terminal/command prompt window, enter the command `ctr-c` (Windows: followed by `N` when asked to terminate batch job).
This will run a cleanup of the directory, and push the changes to your git repository (if configured).

-----------------

## Using LaTeX

Oxford_Thesis.tex contains the structure of your thesis. Here you add or remove chapters from the pdf with the /include command. See line ~197 which includes the chapter 'usage' with the line:
`\include{text/usage}`.
You can remove this chapter by either deleting the line, or 'commenting' it out. Any line preceded with a `%` symbol will be ignored by LaTeX.
Therefore, you can add the literaturereview chapter by uncommenting the line ~198 -- that is, by removing the `%` character.

Chapters should be written as individual files stored in the text folder.
Figures and images should be stored in the figures folder.

That's all you need to know to begin writing! You can learn the rest as it becomes necessary.

You will notice other options in the Oxford_Thesis.tex file which are turned off by commenting them out -- for example, remove `%` from the line `%\tableofcontents` to add the table of contents to your pdf.

See the placeholder pdf (section 1.2) for instructions on working in Latex. You can also refer to the usage.tex chapter and other files in /text/reference_sections/.

-----------------

## Misc Notes
- If not using Atom, remove or change the second line in runThesis.sh (Mac) or runThesisWin.bat (Windows).
- If renaming the Oxford_Thesis.tex, the Oxford_Thesis.pdf filename must be updated in the runThesis file to match (though with the pdf extension).
- (Windows) If running Biber is stalling, open the MiKTeX Console and check for updates to packages. Do this for both user and administrator. This issue has not been completely resolved.
- (Windows) The GSView pdf viewer must be used. Others cause errors when writing to pdf when the file is open.
- In cleaning up the files after a session, the .bbl files are removed. These can take some time to rebuild each new session. To prevent this cleaning, remove the line `rm *.bbl;` or `del *.bbl` from the runThesis files.
