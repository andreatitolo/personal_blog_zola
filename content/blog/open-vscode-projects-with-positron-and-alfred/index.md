+++
title = "Open VSCode projects with Positron (or other IDEs) and Alfred"
description = "Sharing a simple but maybe useful Alfred workflow"
date = "2025-07-24"
draft = false
toc = true
[taxonomies]
tags = ["Alfred", "MacOS", "Positron"]
[extra]
toc_set = 1
+++

This is just a very brief blog post inspired by [Andrew Heiss](https://www.andrewheiss.com/blog/2025/07/22/positron-open-with-finder/). I have been using the same setup for a while (Project Manager extension + Raycast), but I decided to move to [Alfred](https://www.alfredapp.com/) completely at one point. However Alfred didn't seem to have another simple workflow like Raycast do, they were either script-based, or did not work exactly as the Raycast one. Digging through Alfred's documentation I found out that it is possible to create a custom workflow to open VS Code workspace files with specific app(s), by using Alfred built-in actions. I had been using this for a while, but only after seeing the above blog post I though maybe it was worth sharing.

Also, note that [Positron docs](https://positron.posit.co/rstudio-rproj-file.html) do mention a way to open projects in MacOS, but they mostly talk about Raycast and mention Alfred only in relation with Rstudio files (which make also sense, since you cannot account for every custom workflow that people might have)

## Download the workflow

If you want to skip the manual setup and just download the workflow with my defaults (they are modifiable anyway), you can find it on [Codeberg](https://codeberg.org/titoloandrea/alfred-vscode).
The repo has also a README file with some more details on the installation and customization procedure.

Note: you need to have [Alfred Powerpack](https://www.alfredapp.com/powerpack/) to use this workflow (or any workflow).

## Manual setup

Note: I put some docs here and there but don't consider this a proper tutorial, also if you want to learn more about Alfred Workflows you can check their [documentation](https://www.alfredapp.com/help/workflows/).

### New workflow and file filter

1. Open Alfred's Preferences
2. Go to the Workflows tab
3. Click on the `+` button and select `Blank Workflow` - Give it a name and a description, and an icon if you want

{{ image(src="./new-workflow.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy", width_override = 300) }}

4. Right-click on the canvas and select  `Input` > `File Filter` ([Docs](https://www.alfredapp.com/help/workflows/inputs/file-filter/))

{{ image(src="./input.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

5. Decide on a keyword and if you want some placeholder title and subtitle text (you can use {query} to show the current query in the title)
6. Now you need to select a file type, honestly I have no idea how to get UTIs, so the easiest option is just to drag and drop any `.code-workspace` file on the canvas, and Alfred should automatically detect it.

{{ image(src="./keyword.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

7. Move to the `scope` tab and click on the `+` button to add a new folder. This is the folder Alfred will look for the `.code-workspace` files in. You can add multiple folders I think, but I just put the home folder there.

{{ image(src="./scope.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

8. Hit `Save` 

### File actions

1. Right-click on the canvas and select `Actions` > `Open File` ([Docs](https://www.alfredapp.com/help/workflows/actions/open-file/))

{{ image(src="./actions.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

2. Drag and drop the app you want to open the file with. In this case, you can drag and drop the Positron app from the Applications folder, and hit `Save`.

{{ image(src="./open.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

3. Repeat the steps for the other app you want to open the file with. In this case, I also added VSCodium and VSCode.
4. Bonus: right-click on the canvas and select `Actions` > `Reveal File in Finder` ([Docs](https://www.alfredapp.com/help/workflows/actions/reveal-file-in-finder/)) to add a quick action to reveal the folder where the .code-workspace file is located.
5. **IMPORTANT**: Connect the `File Filter` to the `Open File` actions by dragging and dropping from the right "notch" of the `File Filter` to the left "notch" that will appear of the `Open File` actions. You can connect all the actions to the same `File Filter`.

{{ image(src="./connect.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy", width_override = 600) }}

### Actions Modifiers

Now in order to open the file with a specific app, you need to add an action modifier:

1. Click on the circle on the connection line between the `File Filter` and the `Open File` action.
2. Toggle the modifier key that you want to use to open the file with the specific app. In this case, I used none for VSCodium (meaning I just need to press `Enter` to open the file with VSCodium), `Command` for Positron, `Shift` for VSCode, and `Option` for the `Reveal File in Finder` action. You can also add a subtext to actually see what you are doing.

{{ image(src="./connection.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}

### Bonus - Hotkey

If you don't want to type the keyword every time, you can also add a hotkey to the workflow, so that you can just press a key combination to open the workflow. To do so:

1. Right-click on the canvas and select `Triggers` > `Hotkey`. ([Docs](https://www.alfredapp.com/help/workflows/triggers/hotkey/))
2. Type your hotkey into the box that appears.
3. Leave `action` field as `Show Alfred`.
4. In the `argument` field, you can either type the keyword or use a variable to pass the selected file to the workflow. **Note**: you can also just use `none` and the workflow will open with the Alfred box and you can just start typing to search for projects.

{{ image(src="./hotkey.webp", width = "100%", height = "auto" alt="alttext", class = "img-centered class", caption = "", loading = "lazy") }}