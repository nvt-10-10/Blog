import { createApp } from "vue";
import App from "./App.vue";
import CKEditor from "@ckeditor/ckeditor5-vue";
import store from "./store";
import router from "./router/index.js";
// import Vuex
const app = createApp(App);
app.use(router);
app.use(CKEditor);
app.use(store);
app.mount("#app");
