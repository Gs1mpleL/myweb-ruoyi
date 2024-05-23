import request from '@/utils/request'

// 查询岗位列表
export function doPush(msgVo) {
  return request({
    url: '/system/push/doPush',
    method: 'posh',
    params: msgVo
  })
}
export function getPushConfig() {
  return request({
    url: '/system/push/getPushConfig',
    method: 'get'
  })
}

export function saveOrUpdateConfig(pushVo) {
  return request({
    url: '/system/push/saveOrUpdateConfig',
    method: 'post',
    param: pushVo
  })
}
