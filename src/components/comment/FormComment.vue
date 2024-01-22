<template>
  <form class="form-comment" @submit.prevent="addCommentReply">
    <div class="form-comment-group">
      <img :src="user.img" alt="" class="avt-user" />
      <textarea name="" id="" cols="30" rows="10" v-model="comment_form.content" class="form-comment-textarea" placeholder="Viết bình luận" required></textarea>
    </div>
    <div class="form-comment-btn" style="">
      <button class="form-comment-cancel" v-if="is_edit" @click.prevent="cancelEdit">Hủy</button>
      <button class="form-comment-submit">{{ title }}</button>
    </div>
  </form>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  props: {
    comment_id: Number,
    is_edit: Boolean,
    comment_content: String,
  },

  data() {
    return {
      comment_form: {
        user_id: "",
        comment_id: this.comment_id,
        content: "",
      },
      user: Object,
      title: "Bình luận",
    };
  },

  created() {
    console.log("content" + this.is_edit);
    const storedUser = sessionStorage.getItem("user");
    if (storedUser) {
      const user = JSON.parse(storedUser);
      this.comment_form.user_id = user.id;
      this.user = user;
    } else {
      console.log("Không có dữ liệu người dùng trong LocalStorage");
    }
    if (this.is_edit) {
      this.comment_form.content = this.comment_content;
      this.title = "Lưu";
    } else {
      this.comment_form.content = "";
      this.title = "Bình luận";
    }

    console.log("isEdit: \t" + this.is_edit);
  },

  computed: {
    ...mapGetters("comment", ["getItems", "getLoading", "getError"]),
  },

  methods: {
    async addCommentReply() {
      if (this.is_edit === false) {
        await this.$store.dispatch("comment/createCommentReply", this.comment_form);
        this.comment_form.content = "";
        this.$emit("reload-comment", this.comment_id);
      } else {
        this.$emit("reload-comment-edit", this.comment_form.content);
        this.comment_form.content = "";
      }
    },
    cancelEdit() {
      this.$emit("cancel-comment");
    },
  },
};
</script>

<style scoped>
.form-comment {
  padding: 0;
  border: none;
}

.form-comment-btn {
  display: flex;
  justify-content: right;
  align-items: center;
  margin-top: 30px;
}

.form-comment-submit {
  margin-top: 0;
  margin-left: 0;
}

.form-comment-cancel {
  padding: 8px 16px;
  background-color: transparent;
  border-radius: 3px;
  font-weight: 500;
  font-family: Roboto;
  font-size: 1.6rem;
  color: rgb(27, 27, 27);
}
</style>
