const fs = require("node:fs");
const config = require("./js/configs.js").default;

config.defaultServer = "/api/";

config.suggestedServers = [];

fs.unlinkSync("./js/configs.js", console.error);
fs.unlinkSync("./js/configs.ts", console.error);

fs.writeFileSync("./js/configs.ts", "export default " + JSON.stringify(config) + ";");
