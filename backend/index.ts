import express from 'express';
import User from './models/user';
import Post from './models/post';
import Reaction, { ReactionType } from './models/reaction';
import cors from 'cors';

const app = express();
const port = 8080;

const user = new User('3', 'Gessica', 'gessica@gmail.com');
const posts: Array<Post> = [];
const reactions: Map<string, Array<Reaction>> = new Map();

app.use(express.json());
app.use(cors({
    origin: function (origin, callback) {
        callback(null, true); //bypass
    },
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    preflightContinue: false,
    credentials: true,
    optionsSuccessStatus: 204,
    allowedHeaders: ['set-cookie', 'Content-Type', 'cookie', 'cookies', 'connect.sid'],
    exposedHeaders: ['set-cookie', 'Content-Type', 'cookie', 'cookies', 'connect.sid']
}));

app.options('*', cors());

app.use((request, response, next) => {
    setTimeout(() => {
        next();
    }, 500);
});

app.post('/login', (request, response) => {
    console.log(request.body);
    const username = request.body.username;
    const password = request.body.password;

    console.log(`User sent: ${username} and ${password}`);

    if (username === 'Gessica' && password === '123') {
        response.send(user);
    } else {
        response.status(401).send('Unauthorized');
    }
});

app.post('/post', (request, response) => {
    const post = request.body;

    console.log(`User sent post: ${JSON.stringify(post)}`);

    post.id = `${posts.length + 1}`;
    const storedPost = Post.fromJson(post);
    posts.push(storedPost);

    console.log(`Created post: ${JSON.stringify(storedPost)}`);

    response.send(post);
});

app.get('/post', (_request, response) => {
    console.log('User requested all posts');
    console.log(JSON.stringify(posts));
    response.send(posts);
});

app.post('/post/:id/reaction', (request, response) => {
    const postId = request.params.id;
    console.log(`User reacted to post: ${postId}`);

    const post = posts.find((post) => {
        return post.id === postId;
    });
    if (post) {
        const reaction = request.body;

        console.log(`User reaction to post: ${JSON.stringify(reaction)}`);

        const array = reactions[reaction.postId] || [];
        array.push(reaction);
        reaction[reaction.postId] = array;

        post.addReaction(reaction.reactionType);

        console.log(`Post reactions: ${JSON.stringify(post.reactions)}`);

        response.send(post);
    } else {
        console.log(`Not found on posts ${JSON.stringify(posts)}`);
        response.status(404).send('Not found');
    }
});

app.get('/post/:id/reaction', (request, response) => {
    const postId = request.params.id;

    console.log(`User requested reactions to post: ${postId}`);

    const array = reactions[postId];

    if (array) {
        response.send(array);
    } else {
        response.status(404).send('Not found');
    }
});

app.listen(port, () => {
    console.log(`Servidor iniciado na porta ${port}`);
});