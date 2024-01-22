import axios from "../config/axios-config";
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
    async addLikeComment({ commit }, params) {
      commit("setLoading", true);
      axios
        .post("/api/likes/addLikeComment", params)
        .then((response) => {
          commit("setLoading", false);
          commit("setItems", response.data);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },

    async addLikePost({ commit }, params) {
      commit("setLoading", true);
      axios
        .post("/api/likes/addLikePost", params)
        .then((response) => {
          commit("setLoading", false);
          commit("setItems", response.data);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },

    async deleteLikeComment({ commit }, { like_id, comment_id }) {
      commit("setLoading", true);
      axios
        .delete(`/api/likes/deleteLikeComment/${like_id}/comment_id/${comment_id}`)
        .then(() => {
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },

    async deleteLikePost({ commit }, { like_id, post_id }) {
      commit("setLoading", true);
      axios
        .delete(`/api/likes/deleteLikePost/${like_id}/comment_id/${post_id}`)
        .then(() => {
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setLoading", false);
          commit("setError", error);
        });
    },
  },

  getters: {
    getLikeItems: (state) => state.items,
    getLikeLoading: (state) => state.loading,
    getLikeError: (state) => state.error,
  },
};
