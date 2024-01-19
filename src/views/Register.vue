<template>
  <main class="main">
    <div class="main-left">
      <img src="../assets/imgs/registerImg.png" alt="" class="main-img" />
    </div>
    <div class="main-right">
      <h1 class="register-heading">Create Account</h1>

      <div class="sign-in-group">
        <button class="sign-in"><img src="../assets/imgs/google_img.jpg" alt="google" class="sign-in-img" /> Sign up width Google</button>
        <button class="sign-in"><img src="../assets/imgs/facebook.png" alt="google" class="sign-in-img" /> Sign up width Facebook</button>
      </div>
      <p class="or">-OR-</p>

      <form @submit.prevent="submitForm" class="form">
        <input type="text" name="name" id="" v-model="formData.name" class="form-input" placeholder="Full name" />
        <input type="email" name="email" class="form-input" placeholder="Email Address" v-model="formData.email" />
        <input type="password" name="email" class="form-input form-input-password" placeholder="Password" v-model="formData.password" />

        <button type="submit" class="form-submit">Create Account</button>
        <span>Already have an account? <a href="login">Log in</a></span>
      </form>
    </div>
  </main>
</template>
<script>
import axios from "@/config/axios-config";
export default {
  data() {
    return {
      formData: {
        name: "",
        email: "",
        password: "",
        username: "",
        address: "",
        date_of_birth: "",
      },
    };
  },

  methods: {
    show() {
      console.log(this.formData);
    },

    submitForm() {
      axios
        .post("/api/users/create", this.formData)
        .then((response) => {
          console.log("Response from server:", response.data);
          this.$router.push("/login");
        })
        .catch((error) => {
          if (error.response) {
            alert("Email ton tai");
            console.error("Server responded with an error:", error.response.data);
            this.errorMessage = error.response.data;
          } else if (error.request) {
            console.error("No response received from the server");
            this.errorMessage = "No response received from the server";
          } else {
            console.error("Error setting up the request:", error.message);
            this.errorMessage = "Error setting up the request";
          }
        });
    },
  },
};
</script>
<style lang="scss">
@import "../assets/scss/reset.scss";
@import url("https://fonts.googleapis.com/css2?family=Arimo:wght@400;500;600;700&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;0,9..40,700;0,9..40,800;1,9..40,300;1,9..40,400;1,9..40,500;1,9..40,600;1,9..40,700;1,9..40,800&family=Inter:wght@300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700&family=Nunito:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100&family=Source+Sans+3:wght@300;400;500;600;700;800&display=swap");
@import "../assets/scss/register.scss";
</style>
