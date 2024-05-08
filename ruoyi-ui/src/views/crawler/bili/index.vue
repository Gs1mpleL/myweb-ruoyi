<template>
  <div>
    <img :src="qrCodeData" alt="QR Code" />
    <p>登陆状态: {{ loginResult}}</p>
  </div>

</template>

<script>
import QRCode from 'qrcode'
import {getQR, loginByCheckQr} from '@/api/crawler/bili'

export default {
  data() {
    return {
      qrCodeData: '', // 存储二维码数据的URL,
      qrcode_key:'',
      queryCount: 0,
      intervalId: null,
      loginResult:"未扫码"
    }
  },
  mounted() {
    getQR().then(data=>{
      this.qrCodeData = data.data.url
      this.qrcode_key = data.data.qrcode_key
      this.generateQRCode()
      this.startInterval()
    })
  },
  destroyed() {
    this.stopInterval()
  },
  methods: {
    generateQRCode() {
      QRCode.toDataURL(this.qrCodeData, { type: 'image/png', width: 256 }, (err, url) => {
        if (err) throw err
        this.qrCodeData = url
      })
    },
    timedFunction() {
      // 模拟异步操作 查看是否扫码
      setTimeout(() => {
        loginByCheckQr(this.qrcode_key).then(data=>{
          if(data.data === "未扫码"){
            this.queryCount++
          }else {
            this.queryCount = -1
            this.loginResult = "登陆成功！"
          }
        })
      }, 500); // 假设异步操作需要500毫秒
      console.log(this.queryCount)
      // 根据结果判断是否继续执行
      if (this.queryCount === 30 || this.queryCount === -1) {
        this.stopInterval();
      } else {
      }
    },
    // 开始定时执行的函数
    startInterval() {
      if (!this.intervalId) {
        this.intervalId = setInterval(this.timedFunction, 2000);
      }
    },
    // 停止定时执行的函数
    stopInterval() {
      if (this.intervalId) {
        clearInterval(this.intervalId);
        this.intervalId = null;
      }
    },
  },
}
</script>

<style scoped>
/* 添加一些样式 */
</style>
