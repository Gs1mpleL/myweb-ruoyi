<template>
  <div class="card-container">
    <transition-group name="fade" tag="div">
      <div
        class="card"
        v-for="item in items"
        :key="item.id"
        :style="{ backgroundColor: item.color, opacity: item.opacity }"
      >
        <div class="card-content">
          <h2>推送服务：{{ item.type }}</h2>
          <p>你的令牌：{{ item.token }}</p>
        </div>
      </div>
    </transition-group>
  </div>
</template>

<script>
import {getPushConfig,saveOrUpdateConfig,doPush} from "@/api/system/push"
export default {
  data() {
    return {
      items: [
      ]
    };
  },
  mounted() {
    getPushConfig().then(data=>{
      this.items = data.data
    })
  }
};
</script>

<style scoped>
.card-container {
  display: flex;
  flex-wrap: wrap;
  min-width: 100%;
  justify-content: space-around;
}

.card {
  margin: 10px;
  padding: 20px;
  background-color: #f0f0f0;
  border: 1px solid #ddd;
  flex: 0 0 calc(33.3333% - 20px); /* 减去两侧的margin */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  //border-radius: 4px;
  transition: all 0.3s ease; /* 为卡片添加过渡效果，以便在更新时更平滑 */
}

.card:hover {
  /* 当鼠标悬停时改变颜色或透明度 */
  //background-color: rgba(item.color, 0.8); /* 注意：这里不能直接使用item.color，只是一个示例 */
  transform: scale(1.08); /* 稍微放大 */
}
.card-content {
  text-align: left;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
