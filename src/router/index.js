import { createRouter, createWebHistory } from "vue-router";
import route from "./Router.js";

const routes = [...route];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
