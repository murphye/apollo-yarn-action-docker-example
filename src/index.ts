import { ApolloServer } from 'apollo-server';
import { typeDefs } from './schema';
import { resolvers } from './resolvers';
import { InigoPlugin } from "inigo.js";

const server = new ApolloServer({
  typeDefs,
  resolvers,
  plugins: [InigoPlugin()],
});

server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});