# Setup for Oxford Thesis Template

These instructions will set up Latex with an editor, viewer, git version control and automatic online backup. The latex file will automatically compile when a change is detected, thus streamlining the editing process.

These instructions are replicated in the output pdf file.


## Setup
Note: These instructions are for Mac OSX.

- Install Latex etc as usual.
- (Optional: editor) Install Atom (or change the second line in runThesis.sh), and within its settings install the packages (the first two are important, the remainder are up to preference):
  - language-latex
  - autocomplete-latex-cite
  - autocomplete-paths
  - highlight-selected
  - Zen
  - typewriter
  - wordcount
  It is also recommended to set the theme to One Dark. **Settings -> Themes**
- (Optional) Install Skim (pdf viewer). If not installed, remove the first line in the latexmkrc file. Skim allows auto-refreshing when the source file is changed, and CMD-SHIFT-clicking on a word will direct the cursor to that line in Atom. In Skim, set **Preferences -> Sync -> Preset = Atom**.
- Move or download this **OxThesis-Setup** folder to your desktop. Open a terminal window and run the command: `cd ~/Desktop`
- (Optional: git repository) If desired, this script will automatically commit changes to a git repo and push to an online repository. This is recommended to maintain a versioned, online backup.
   - To do so, create an account with https://bitbucket.org/ (BitBucket offers private repositories whereas Github does not). Create a repository from their web UI (use default settings, but don't create readme). Once created, it should display a command in the format of:
   `git clone https://USERNAME@bitbucket.org/USERNAME/REPO-NAME.git`
    In the terminal window, run the command copied from BitBucket. This will create the thesis folder on your desktop.
   - Copy the contents of this 'OxThesis-Setup' folder into the new folder with the command:
    `DITTO OxThesis-Setup REPO-NAME`
    `rm -iR OxThesis-Setup`
   - This file has now been deleted. Close this window (without saving) and open the new readme in `~/Desktop/REPO-NAME/Oxford_Thesis.pdf` to continue.
   - navigate the terminal window to the new folder with the command: `cd REPO-NAME`.
   - Open the `runThesis.sh` file and uncomment the three git lines (remove the preceding hash).
   - It is recommended to run the following commands in terminal, with your details:
   - `git config --global user.name "Your Name"`
   - `git config --global user.email you@example.com`
- Set Mendeley to automatically create a Bibtex file for 'whole library' (or group if relevant) at an appropriate directory (i.e. `/YOUR-MENDELEY-LIBRARY-DIR/_bibtex`). The setting in the `Oxford_Thesis.tex` file currently expects the filename `library.bib`, which should be the default for Mendeley's output. This should work with other reference managers but these haven't been tested.
- Remove the existing `./bib` folder. Use Terminal to create a symlink of the Mendeley folder containing your bib file in its place. Run the symlink command in terminal (don't miss the period at the end):
`ln -s /YOUR-MENDELEY-LIBRARY-DIR/_bibtex/ .`
Drag the `_bibtex` folder into the terminal window rather than typing the path to autocomplete. The symlink will be created in the current directory, which should be this folder but if not, check with `pwd` and move the symlink into the thesis folder manually.
If using git repository, uncomment the bib line in `.gitignore`.
 Alternatively if using a static bib file, keep the existing bib folder and simply replace the `library.bib` file. If using git and a static file, don't uncomment the bib line in `.gitignore`.
- Make the startup script executable with the terminal command: `chmod a+x runThesis.sh`. Create an alias (right-click file -> create alias) to this script where needed (e.g., the dock).
- Copy the thesis folder somewhere appropriate if desired.
- (Note:) If the `Oxford_Thesis.tex` file name is changed, you will need to update the name of the `Oxford_Thesis.pdf` filename on lines 4 and 7 in the `runThesis.sh` file. This script acts as a 'auto-run' which will open the folder in Atom and run the compiler in the background. It is set to watch for changes and autoupdate the PDF output, which will update in the Skim view. Lines 4-7 are added to clean the directory once the terminal process is terminated using ctrl-c. Removing these files increases build time so these commands can be removed if preferred.
