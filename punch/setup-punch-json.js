import { walk } from "https://deno.land/std@0.207.0/fs/walk.ts";
import { basename } from "https://deno.land/std@0.207.0/path/mod.ts";

const routes = [];

for await (const entry of walk("./src/contents/posts")) {
  const route = basename(entry.path, ".md");
  routes.push("/" + route);
}

await Deno.writeTextFile(
  "./src/punch.json",
  JSON.stringify({
    routes,
  }),
);
