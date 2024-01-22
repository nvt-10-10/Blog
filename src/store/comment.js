import axios from "@/config/axios-config";

export default {
  namespaced: true,

  state: {
    items: [],
    loading: false,
    error: null,
  },

  mutations: {
    setItems(state, items) {
      state.items = items;
    },
    setLoading(state, loading) {
      state.loading = loading;
    },
    setError(state, error) {
      state.error = error;
    },
  },

  actions: {
    async fetchCommentByPostID({ commit }, { post_id, user_id }) {
      commit("setLoading", true);
      await axios
        .get(`/api/comments/post/${post_id}/user_id/${user_id}`)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },

    async fetchCommentReplyByCommentID({ commit }, { comment_id, user_id }) {
      commit("setLoading", true);
      await axios
        .get(`/api/comments/comment-reply/${comment_id}/user_id/${user_id}`)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },

    async createComment({ commit }, params) {
      commit("setLoading", true);
      await axios
        .post(`api/comments/create`, params)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setError", error);
        });
    },

    async createCommentReply({ commit }, params) {
      commit("setLoading", true);
      await axios
        .post(`api/comments/create-reply`, params)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setError", error);
        });
    },

    async updateComment({ commit }, params) {
      commit("setLoading", true);
      await axios
        .patch(`api/comments/update`, params)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setError", error);
        });
    },

    async deleteCommentByID({ commit }, id) {
      await axios
        .delete("/api/comments/" + id)
        .then(() => {
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setError", error);
        });
    },
  },

  getters: {
    getItems: (state) => {
      return state.items;
    },
    getLoading: (state) => {
      return state.loading;
    },
    getError: (state) => {
      return state.error;
    },
    // Add more getters as needed
  },
};
