import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function getBiliData() {
  return request({
    url: '/crawler/bili/getBiliDataByUserId',
    method: 'get'
  })
}

export function quickTest() {
  return request({
    url: '/crawler/bili/quickTest',
    method: 'get'
  })
}
export function getQR() {
  return request({
    url: '/crawler/bili/getQR',
    method: 'get'
  })
}
export function loginByCheckQr(qr_key) {
  return request({
    url: '/crawler/bili/loginByCheckQr/'+qr_key,
    method: 'get'
  })
}
