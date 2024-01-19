<template>
  <header class="header">
    <div class="container">
      <div class="header-inner">
        <img src="https://viblo.asia/logo_full.svg" alt="" class="logo" />

        <nav class="navbar">
          <ul class="navbar-list">
            <li class="navbar-item">
              <router-link :to="{ path: '/post-list' }">
                <a href="" class="navbar-link">Bài viết</a>
              </router-link>
            </li>
            <li class="navbar-item"><a href="" class="navbar-link">Hỏi đáp </a></li>
            <li class="navbar-item"><a href="" class="navbar-link">Thảo luận</a></li>
          </ul>
        </nav>

        <div class="navbar-right">
          <form action="" class="form">
            <input type="text" class="form-input" />
            <button class="form-submit">
              <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
              </svg>
            </button>
          </form>

          <button class="navbar-right-button">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="6" viewBox="0 0 192 512">
              <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
              <path d="M48 80a48 48 0 1 1 96 0A48 48 0 1 1 48 80zM0 224c0-17.7 14.3-32 32-32H96c17.7 0 32 14.3 32 32V448h32c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H64V256H32c-17.7 0-32-14.3-32-32z" />
            </svg>
          </button>

          <button class="navbar-right-button">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512">
              <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
              <path
                d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v25.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm0 96c61.9 0 112 50.1 112 112v25.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V208c0-61.9 50.1-112 112-112zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"
              />
            </svg>
          </button>

          <button class="navbar-right-button">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
              <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
              <path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z" />
            </svg>
          </button>

          <button class="navbar-right-button">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
              <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
              <path
                d="M0 416c0 17.7 14.3 32 32 32l54.7 0c12.3 28.3 40.5 48 73.3 48s61-19.7 73.3-48L480 448c17.7 0 32-14.3 32-32s-14.3-32-32-32l-246.7 0c-12.3-28.3-40.5-48-73.3-48s-61 19.7-73.3 48L32 384c-17.7 0-32 14.3-32 32zm128 0a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM320 256a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm32-80c-32.8 0-61 19.7-73.3 48L32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l246.7 0c12.3 28.3 40.5 48 73.3 48s61-19.7 73.3-48l54.7 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-54.7 0c-12.3-28.3-40.5-48-73.3-48zM192 128a32 32 0 1 1 0-64 32 32 0 1 1 0 64zm73.3-64C253 35.7 224.8 16 192 16s-61 19.7-73.3 48L32 64C14.3 64 0 78.3 0 96s14.3 32 32 32l86.7 0c12.3 28.3 40.5 48 73.3 48s61-19.7 73.3-48L480 128c17.7 0 32-14.3 32-32s-14.3-32-32-32L265.3 64z"
              />
            </svg>
          </button>

          <button class="navbar-right-button">
            <img :src="user?.img" alt="" class="avt" />
          </button>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  data() {
    let user = null;

    const storedUser = sessionStorage.getItem("user");
    if (storedUser) {
      user = JSON.parse(storedUser);
    } else {
      console.log("Không có dữ liệu người dùng trong LocalStorage");
    }

    return {
      user: user,
    };
  },
};
</script>

<style lang="scss">
.header {
  position: sticky;
  display: flex;
  top: 0;
  left: 0;
  background-color: #fff;
  padding: 10px 0;
  box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);
  z-index: 999;
  &-inner {
    display: flex;
    align-items: center;
  }
}

.avt {
  width: 37px;
  height: 37px;
  border-radius: 50%;
  object-fit: cover;
}

.form {
  position: relative;
  display: flex;
  align-items: center;

  &-input {
    outline: none;
    line-height: 1;
    width: 100%;
    height: 38px;
    padding: 0 70px 0 24px;
    border-radius: 3px;
    border: 2px solid #d6d6d7;
  }

  &-submit {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    top: 0;
    bottom: 0;
    right: 0;
    padding: 6px 12px;
    background-color: #5488c7;
    border-color: #5488c7;

    > svg {
      fill: aliceblue;
    }
  }
}

.logo {
  width: 62px;
  height: 21px;
  object-fit: contain;
}

.navbar {
  margin-left: 64px;
  &-list {
    display: flex;
  }
  &-item + &-item {
    margin-left: 25px;
  }
  &-link {
    font-weight: 700;
    line-height: 40px;
    color: #9b9b9b;
  }

  &-right {
    display: flex;
    margin-left: auto;

    &-button {
      width: 40px;
      height: 40px;

      &:hover {
        cursor: pointer;
      }
      > svg {
        height: 19px;
        width: 19px;
        fill: rgb(155, 155, 155);
      }
    }
  }
}
</style>
