import request from '@/utils/request'

// 查询推送服务列表
export function listPushConfig(query) {
    return request({
        url: '/system/pushConfig/list',
        method: 'get',
        params: query
    })
}

// 查询推送服务详细
export function getPushConfig(id) {
    return request({
        url: '/system/pushConfig/' + id,
        method: 'get'
    })
}

// 新增推送服务
export function addPushConfig(data) {
    return request({
        url: '/system/pushConfig',
        method: 'post',
        data: data
    })
}

// 修改推送服务
export function updatePushConfig(data) {
    return request({
        url: '/system/pushConfig',
        method: 'put',
        data: data
    })
}

// 删除推送服务
export function delPushConfig(id) {
    return request({
        url: '/system/pushConfig/' + id,
        method: 'delete'
    })
}
