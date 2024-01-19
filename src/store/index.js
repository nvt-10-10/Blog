// src/store/index.js
import { createStore } from "vuex";
import postModule from "./post";
import commentModule from "./comment";

export default createStore({
  modules: {
    postModule,
    commentModule,
  },
});
