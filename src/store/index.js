// src/store/index.js
import { createStore } from "vuex";
import post from "./post";
import comment from "./comment";
import like from "./like";
import user from "./user";
export default createStore({
  modules: {
    post,
    comment,
    like,
    user,
  },
});
