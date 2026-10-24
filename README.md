# tsuikyuu

Small, interactive explainers for algorithms, plus the early experiment they grew out of.

## Explainers

Each explainer is a single standalone HTML file in [`explainers/`](explainers). There is no build step and no dependency beyond Google Fonts. Open the file in a browser, or serve the folder with any static web server.

| Explainer | What it shows |
| --- | --- |
| [One loop, many searches](explainers/one-loop-many-searches.html) | Breadth-first, depth-first, cheapest-first (Dijkstra), greedy and A* are one search loop with a different `removeChoice` function. Paint walls and mud on a map and watch each strategy run. |

More explainers will be added to the same folder.

## The original search sketch

`lib/search.coffee` and `test/search.coffee` hold an early (2012) CoffeeScript sketch of the same generic search loop, with `mocha` tests. It is kept for reference. It has known problems, such as comparing states by reference, so the explainer's loop is the better starting point.

## Licence

Released under the [PolyForm Noncommercial License 1.0.0](LICENSE). You may use, copy and modify the work for any noncommercial purpose. Commercial use needs separate permission from the author.
