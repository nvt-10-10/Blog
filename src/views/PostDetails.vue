<template>
  <header-component></header-component>
  <main>
    <div class="post">
      <div class="container">
        <div class="post-inner">
          <div class="post-left">
            <div class="post-content-top">
              <a href="#!">
                <div class="user-info">
                  <img :src="post?.user?.img" alt="" class="user-avt" />

                  <span class="user-name">{{ post?.user?.name }}</span>
                </div>
              </a>

              <div class="post-info">
                <span class="post-time">{{ post.date }}</span>

                <div class="post-info-bottom">
                  <div class="post-info-item">
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512">
                      <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                      <path
                        d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z"
                      />
                    </svg>

                    <span>{{ post.count_view }}</span>
                  </div>

                  <div class="post-info-item">
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                      <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                      <path
                        d="M123.6 391.3c12.9-9.4 29.6-11.8 44.6-6.4c26.5 9.6 56.2 15.1 87.8 15.1c124.7 0 208-80.5 208-160s-83.3-160-208-160S48 160.5 48 240c0 32 12.4 62.8 35.7 89.2c8.6 9.7 12.8 22.5 11.8 35.5c-1.4 18.1-5.7 34.7-11.3 49.4c17-7.9 31.1-16.7 39.4-22.7zM21.2 431.9c1.8-2.7 3.5-5.4 5.1-8.1c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208s-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6c-15.1 6.6-32.3 12.6-50.1 16.1c-.8 .2-1.6 .3-2.4 .5c-4.4 .8-8.7 1.5-13.2 1.9c-.2 0-.5 .1-.7 .1c-5.1 .5-10.2 .8-15.3 .8c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c4.1-4.2 7.8-8.7 11.3-13.5c1.7-2.3 3.3-4.6 4.8-6.9c.1-.2 .2-.3 .3-.5z"
                      />
                    </svg>
                    <span>{{ count_Comment }} </span>
                  </div>

                  <div class="post-info-item">
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512" @click="updateCountLike" :class="{ liked: isLike }">
                      <path
                        d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.2s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"
                      />
                    </svg>
                    <span>{{ count_like }}</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="post-content">
              <h2 class="post-title">{{ post.title }}</h2>

              <div class="post-main" v-html="post.content"></div>
            </div>
          </div>
          <div class="post-right"></div>
        </div>
      </div>
    </div>

    <div class="related-articles">
      <div class="container">
        <h2 class="related-articles-heading">Bài viết khác từ {{ post?.user?.name }}</h2>
        <div class="post-related-list">
          <article class="post-related-item" v-for="(item, index) in posts" :key="index">
            <div class="post-related-info">
              <h3 class="post-related-title">
                <router-link :to="{ path: '/post-details/' + item.id }">
                  {{ item.title }}
                </router-link>
              </h3>
              <span class="post-related-user">{{ item?.user?.name }}</span>

              <div class="post-stats">
                <span class="post-stats-item">
                  <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                      d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z"
                    />
                  </svg>
                  {{ item.count_view }}
                </span>

                <span class="post-stats-item">
                  <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                      d="M123.6 391.3c12.9-9.4 29.6-11.8 44.6-6.4c26.5 9.6 56.2 15.1 87.8 15.1c124.7 0 208-80.5 208-160s-83.3-160-208-160S48 160.5 48 240c0 32 12.4 62.8 35.7 89.2c8.6 9.7 12.8 22.5 11.8 35.5c-1.4 18.1-5.7 34.7-11.3 49.4c17-7.9 31.1-16.7 39.4-22.7zM21.2 431.9c1.8-2.7 3.5-5.4 5.1-8.1c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208s-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6c-15.1 6.6-32.3 12.6-50.1 16.1c-.8 .2-1.6 .3-2.4 .5c-4.4 .8-8.7 1.5-13.2 1.9c-.2 0-.5 .1-.7 .1c-5.1 .5-10.2 .8-15.3 .8c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c4.1-4.2 7.8-8.7 11.3-13.5c1.7-2.3 3.3-4.6 4.8-6.9c.1-.2 .2-.3 .3-.5z"
                    />
                  </svg>
                  {{ item.count_comment }}
                </span>

                <span class="post-stats-item">
                  <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                      d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.2s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"
                    />
                  </svg>
                  {{ item.count_like }}
                </span>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>

    <div class="comment">
      <div class="container">
        <div class="comment-title">Bình luận</div>

        <form class="form-comment" @submit.prevent="addComment">
          <div class="form-comment-group">
            <img :src="user.img" alt="" class="avt-user" />
            <textarea name="" id="" cols="30" rows="10" v-model="comment_form.content" class="form-comment-textarea" placeholder="Viết bình luận" required></textarea>
          </div>
          <button class="form-comment-submit">Bình luận</button>
        </form>

        <div class="comment-list">
          <CommentItem v-for="comment in comments" :key="comment.id" :data="comment" @updateCountComment="updateCountComment" @deleteItem="updateCommentDelete" />
        </div>
      </div>
    </div>
  </main>

  <footer style="margin-top: 80px"></footer>
  <router-view></router-view>
</template>

<style lang="scss">
@import "../assets/scss/reset.scss";
@import "../assets/scss/base.scss";
@import "../assets/scss/post_details.scss";
.liked {
  fill: rgb(0, 96, 221) !important;
}
</style>

<script>
// Import Axios
import axios from "@/config/axios-config";

import HeaderComponent from "@/components/Header.vue";
import CommentItem from "@/components/comment/CommentItem.vue";

export default {
  components: {
    HeaderComponent,
    CommentItem,
  },
  computed: {},
  watch: {
    "$route.params.id": {
      handler: function (newId, oldId) {
        const storedUser = sessionStorage.getItem("user");
        if (storedUser) {
          const user = JSON.parse(storedUser);
          this.comment_form.user_id = user.id;
          this.user_id = user.id;
          this.like_post_form.user_id = user.id;
          this.like_post_form.post_id = this.$route.params.id;
          this.user = user;
        } else {
          console.log("Không có dữ liệu người dùng trong LocalStorage");
        }
        if (newId !== oldId) {
          this.fetchDataByPost(newId);
          this.fetchCommentByPostID(newId);
        }
      },
      immediate: true,
    },
  },

  data() {
    return {
      post: [],
      posts: [],
      comment_form: {
        content: "",
        user_id: "",
        post_id: "",
      },

      like_post_form: {
        like_id: -1,
        user_id: "",
        post_id: "",
      },

      comments: [],
      projectId: null,
      count_Comment: "",
      user_id: -1,
      count_like: "",
      isLike: false,
      edit: false,
      createdFetchCalled: false,
      user: Object,
    };
  },

  created() {
    this.fetchDataByPost();
    this.fetchCommentByPostID();
    this.createdFetchCalled = true;
  },

  methods: {
    fetchDataByPost() {
      let url = "";
      this.projectId = this.$route.params.id;
      if (this.user_id === null) {
        url = "api/posts/" + this.projectId;
      } else {
        url = `api/posts/${this.projectId}/user_id/${this.user_id}`;
      }

      axios
        .get(url)
        .then((response) => {
          if (this.user === null) {
            this.post = response.data;
          } else {
            this.post = response.data.post;
            this.isLike = response.data.isLike;
            this.like_post_form.like_id = response.data.id_like;
          }
          this.fetchDataByUserID();
          this.count_Comment = this.post.count_comment;
          this.count_like = this.post.count_like;
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },
    fetchDataByUserID() {
      axios
        .get(`api/posts/user/${this.post?.user?.id}/post/${this.post.id}`)
        .then((response) => {
          this.posts = response.data;
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },

    fetchCommentByPostID() {
      // this.comments = computed(=>{
      //   this.$store.dispatch("commentModule/fetchDataPostByID", { post_id: this.projectId, user_id: this.user_id });
      // })
      axios
        .get(`/api/comments/post/${this.projectId}/user_id/${this.user_id}`)
        .then((response) => {
          this.comments = response.data;
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },

    updateCommentDelete(id) {
      console.log(id);

      for (let comment of this.comments) {
        console.log(comment);
      }
      const index = this.comments.findIndex((comment) => comment.id === id);
      console.log(index);
      this.comments.splice(index, 1);
    },

    addComment() {
      this.comment_form.post_id = this.$route.params.id;
      axios
        .post(`api/comments/create`, this.comment_form)
        .then((response) => {
          console.log("newComment " + JSON.stringify(response.data));

          if (this.comments?.length > 0) {
            this.comments.unshift(response.data);

            this.updateCountComment();
          } else {
            this.fetchCommentByPostID();
          }
          this.comment_form.content = "";
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },

    updateCountComment() {
      this.count_Comment = this.count_Comment + 1;
    },

    async updateCountLike() {
      if (!this.isLike) {
        console.log(this.like_post_form);
        axios
          .post(`/api/likes/addLikePost`, this.like_post_form)
          .then((response) => {
            this.like_post_form.like_id = response.data.id;
          })
          .catch((error) => {
            console.error("Error fetching data:", error);
          });
        this.count_like = this.count_like + 1;
      } else {
        this.count_like = this.count_like - 1;
        console.log(this.like_post_form);
        axios
          .delete(`/api/likes/deleteLikePost/${this.like_post_form.like_id}/post_id/${this.projectId}`)
          .then((response) => {
            console.log(response.data);
          })
          .catch((error) => {
            console.error("Error fetching data:", error);
          });
      }
      this.isLike = !this.isLike;
    },
  },
};
</script>
