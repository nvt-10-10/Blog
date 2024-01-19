<!-- CommentList.vue -->
<template>
  <div class="comment-list">
    <CommentItem v-for="(comment, index) in comments" :key="index" :comment="comment" :showReplies="fetchCommentReplyByCommentID" @comment_id="con3" />
  </div>
</template>

<script>
import CommentItem from "./CommentItem.vue";
import axios from "@/config/axios-config";

export default {
  components: {
    CommentItem,
  },

  created() {
    console.log("Loi ne");
    console.log(this.post_id);
    this.fetchCommentByPostID();
  },

  data() {
    return {
      comments: [],
    };
  },

  props: {
    post_id: String,
  },

  methods: {
    fetchCommentByPostID() {
      axios
        .get(`api/comments/post/${this.post_id}`)
        .then((response) => {
          this.comments = response.data;
          console.log(this.comments);
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },
  },
};
</script>
