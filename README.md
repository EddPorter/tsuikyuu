# tsuikyuu

Small, interactive explainers for algorithms. The name is 追及, "pursuit".

Published at <https://eddporter.com/tsuikyuu/>.

## Explainers

Each explainer is a single standalone HTML file in its own folder, so its address has no `.html` on the end. There is no build step and no dependency beyond Google Fonts. Open the file in a browser, or serve the repository with any static web server.

| Explainer | What it shows |
| --- | --- |
| [One loop, many searches](one-loop-many-searches/) | Breadth-first, depth-first, cheapest-first (Dijkstra), greedy and A* are one search loop with a different `removeChoice` function. Paint walls and mud on a map and watch each strategy run. |
| [Just enough letters](shortest-unique-identifiers/) | The fewest letters that pick out one word from a list. Swap how a search matches (contains, starts with, letters in order), what you are looking for, and how matches are counted, then watch the answers and the work change. |
| [Shared beginnings](tries/) | Tries: a tree that stores each shared beginning once. Build one letter by letter, look words up, count what it saves, then squash it into a suffix tree. |
| [Nearly the same](fuzzy-hashing/) | Fuzzy hashing: why an ordinary hash cannot spot near-copies of a message, and how shingles, MinHash and banding find a whole mailing campaign without comparing every pair. Uses made-up messages only. |
| [Best match first](fuzzy-finding/) | How a fuzzy finder ranks its matches: choosing which letters match, scoring them, finding the best placement with dynamic programming, and staying fast on thousands of items. Uses made-up file names only. |
| [What changed?](what-changed/) | How a diff works: the longest common subsequence, the dynamic-programming grid filled step by step, edit distance with swaps, and trimming for large files. Uses made-up text only. |
| [Read it backwards](boyer-moore/) | Boyer–Moore–Horspool string search: compare the pattern from its last letter, skip ahead on a mismatch, and measure how much of the text is never looked at. Uses made-up text only. |

More explainers will be added as new folders, and listed in [`index.html`](index.html).

## Layout

| Path | What it is |
| --- | --- |
| `index.html` | The landing page that lists the explainers |
| `<name>/index.html` | One folder per explainer, each holding a single HTML file |
| `.nojekyll` | Stops GitHub Pages running Jekyll over the site |

## Licence

Released under the [PolyForm Noncommercial License 1.0.0](LICENSE). You may use, copy and modify the work for any noncommercial purpose. Commercial use needs separate permission from the author.
