# tsuikyuu

Small, interactive explainers for algorithms. The name is 追及, "pursuit".

Published at <https://eddporter.com/tsuikyuu/>.

## Explainers

Each explainer is a single standalone HTML file in [`explainers/`](explainers). There is no build step and no dependency beyond Google Fonts. Open the file in a browser, or serve the folder with any static web server.

| Explainer | What it shows |
| --- | --- |
| [One loop, many searches](explainers/one-loop-many-searches.html) | Breadth-first, depth-first, cheapest-first (Dijkstra), greedy and A* are one search loop with a different `removeChoice` function. Paint walls and mud on a map and watch each strategy run. |

More explainers will be added to the same folder, and listed in [`index.html`](index.html).

## Layout

| Path | What it is |
| --- | --- |
| `index.html` | The landing page that lists the explainers |
| `explainers/` | One HTML file per explainer |
| `.nojekyll` | Stops GitHub Pages running Jekyll over the site |

## Licence

Released under the [PolyForm Noncommercial License 1.0.0](LICENSE). You may use, copy and modify the work for any noncommercial purpose. Commercial use needs separate permission from the author.
