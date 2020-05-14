# mp4topng

The `mp4topng` is a utility script to convert an mp4 file into sequence of PNGs.
It is used in order to import animated images into beamer presentation. 

```bash
    usage: mp4topng [[[-i --input input_video ] [-o --output output_dir]] | [-h]]
```

To import image in beamer you have to add the following lines: 
```latex
\documentclass{beamer}
\usepackage{animate}

\begin{document}
\begin{frame}{Embedded Animation}
  \animategraphics[loop,controls,width=\linewidth]{10}{images-}{0}{16}
\end{frame}
\end{document}
```
*This kind of animation requires a JavaScript-supporting PDF viewer, such as Acrobat Reader.*

Reference: https://tex.stackexchange.com/questions/240243/getting-gif-and-or-moving-images-into-a-latex-presentation
