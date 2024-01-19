<template>
  <!-- <div id="app">
    <ckeditor :editor="editor" v-model="editorData" :config="editorConfig" @input="handleInput"></ckeditor>
  </div> -->
  <router-view></router-view>
</template>

<script>
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";

export default {
  name: "app",
  data() {
    return {
      editor: ClassicEditor,
      editorData: "<p>Content of the editor.</p>",
      editorConfig: {
        // The configuration of the editor.
      },
    };
  },

  methods: {
    handleInput() {
      // Access the editor content and log it to the console

      console.log(this.editorData);
    },
  },
};
</script>
