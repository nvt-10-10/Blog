<template>
  <form class="" @submit.prevent="submitForm">
    <div class="form-group">
      <span>Tiêu đề: </span>
      <br />
      <input type="text" name="" v-model="formData.title" id="" placeholder="Tiêu đề" required />
    </div>
    <div class="form-group">
      <span>Nội dung: </span> <br />
      <ckeditor :editor="editor" v-model="formData.content" :config="editorConfig"></ckeditor>
    </div>
    <div class="form-group"><button>Đăng tin</button></div>
  </form>
  <router-view></router-view>
</template>

<script>
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
export default {
  data() {
    return {
      formData: {
        title: "",
        content: "<p>Content of the editor.</p>",
        user_id: 1,
      },
      editor: ClassicEditor,
      editorConfig: {},
    };
  },
  methods: {
    show() {
      console.log(this.formData);
    },

    submitForm() {
      this.$store.dispatch("createPost", this.formData);
      this.show();
    },
  },
};
</script>
