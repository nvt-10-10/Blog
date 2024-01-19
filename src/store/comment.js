import axios from "@/config/axios-config";

export default {
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
    fetchDataPostByID({ commit }, { post_id, user_id }) {
      axios
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
  },

  getters: {
    getItems: (state) => {
      return state.items;
    },
  },
};
