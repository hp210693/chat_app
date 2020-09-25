import express, { query, response } from "express";
import crypto from "crypto";
import { graphqlHTTP } from "express-graphql";
import { graphql, buildSchema } from "graphql";

const app = express();
const port = 3000;

const { publicKey, privateKey } = crypto.generateKeyPairSync("rsa", {
  modulusLength: 2048,
});
// This is the data we want to encrypt
const data = "my secret data";

const encryptedData = crypto.publicEncrypt(
  {
    key: publicKey,
    //  padding: crypto.constants.RSA_PKCS1_OAEP_PADDING,
    // oaepHash: "sha256",
  },
  // We convert the data string to a buffer using `Buffer.from`
  Buffer.from(data)
);

// The encrypted data is in the form of bytes, so we print it in base64 format
// so that it's displayed in a more readable form
console.log("encypted data: ", encryptedData.toString("base64"));

const schema = buildSchema(`
  type Query {
    hello: String
  }
`);

const root = {
  hello: () => {
    return "Helo word";
  },
};

/*graphql(schema, "{hello}", root).then((response) => {
  console.log(response);
});*/

app.use(
  '/graphql',
  graphqlHTTP({
    schema: schema,
    rootValue: root,
    graphiql: true,
  })
);

app.get("/", (req, res) => {
  res.send("hello hung!");
});

app.listen(port, () => console.log("Sever is running"));
