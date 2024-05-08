package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.api.domain.SysPushConfig;
import com.ruoyi.system.service.ISysPushConfigService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 推送服务Controller
 *
 * @author ruoyi
 * @date 2024-05-08
 */
@RestController
@RequestMapping("/pushConfig")
public class SysPushConfigController extends BaseController {
    @Autowired
    private ISysPushConfigService sysPushConfigService;

    /**
     * 查询推送服务列表
     */
    @RequiresPermissions("system:pushConfig:list")
    @GetMapping("/list")
    public TableDataInfo list(SysPushConfig sysPushConfig) {
        startPage();
        List<SysPushConfig> list = sysPushConfigService.selectSysPushConfigList(sysPushConfig);
        return getDataTable(list);
    }
    /**
     * 查询推送服务列表
     */
    @RequiresPermissions("system:pushConfig:list")
    @GetMapping("/getByType/{type}")
    public R<?> getByType(@PathVariable String type) {
        SysPushConfig sysPushConfig = sysPushConfigService.getByType(type);
        return R.ok(sysPushConfig);
    }

    /**
     * 导出推送服务列表
     */
    @RequiresPermissions("system:pushConfig:export")
    @Log(title = "推送服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPushConfig sysPushConfig) {
        List<SysPushConfig> list = sysPushConfigService.selectSysPushConfigList(sysPushConfig);
        ExcelUtil<SysPushConfig> util = new ExcelUtil<SysPushConfig>(SysPushConfig. class);
        util.exportExcel(response, list, "推送服务数据");
    }

    /**
     * 获取推送服务详细信息
     */
    @RequiresPermissions("system:pushConfig:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysPushConfigService.selectSysPushConfigById(id));
    }

    /**
     * 新增推送服务
     */
    @RequiresPermissions("system:pushConfig:add")
    @Log(title = "推送服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPushConfig sysPushConfig) {
        return toAjax(sysPushConfigService.insertSysPushConfig(sysPushConfig));
    }

    /**
     * 修改推送服务
     */
    @RequiresPermissions("system:pushConfig:edit")
    @Log(title = "推送服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPushConfig sysPushConfig) {
        return toAjax(sysPushConfigService.updateSysPushConfig(sysPushConfig));
    }

    /**
     * 删除推送服务
     */
    @RequiresPermissions("system:pushConfig:remove")
    @Log(title = "推送服务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysPushConfigService.deleteSysPushConfigByIds(ids));
    }
}
