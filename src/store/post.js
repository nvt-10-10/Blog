import axios from "../config/axios-config";

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
    async fetchData({ commit }, id) {
      commit("setLoading", true);

      axios
        .get(`api/posts/${id}`)
        .then((response) => {
          // Kết thúc loading và cập nhật trạng thái
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          // Kết thúc loading và ghi nhận lỗi
          commit("setItems", []);
          commit("setLoading", false);
          commit("setError", error.message || "Error fetching items");
        });
    },

    async addPost({ commit }, form) {
      commit("setLoading", true);
      axios
        .post(`/api/posts/create`, form)
        .then((response) => {
          commit("setItems", response.data);
          commit("setLoading", false);
          commit("setError", null);
        })
        .catch((error) => {
          commit("setItems", []);
          commit("setLoading", false);
          commit("setError", error.message || "Error fetching items");
        });
    },
  },
};
