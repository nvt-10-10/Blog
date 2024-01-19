const routes = [
  {
    path: "/register",
    component: () => import("../views/Register.vue"),
  },

  {
    path: "/login",
    component: () => import("../views/Login.vue"),
  },

  {
    path: "/post",
    component: () => import("../views/Post.vue"),
  },

  {
    path: "/post-details/:id",
    component: () => import("../views/PostDetails.vue"),
  },

  {
    path: "/post-list",
    name: "PostDetails",
    component: () => import("../views/ListPost.vue"),
  },
];

export default routes;
