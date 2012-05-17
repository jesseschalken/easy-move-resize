easy-move-resize
================

An AutoHotkey script to get Linux-style window dragging and resizing.

- `Left Win + Left Click` to move.
- `Left Win + Right Click` to resize. Resize drags the nearest corner of the
  window.

To change the keybindings, just change the `LWin & LButton` and `LWin &
RButton` expressions. For example, change them to `Alt & LButon` and `Alt &
MButton` to get Metacity-style resizing.

Script is based on the following:
- http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
- http://www.autohotkey.com/docs/scripts/EasyWindowDrag_(KDE).htm
