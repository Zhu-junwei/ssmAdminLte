package com.zjw.controller;

import com.github.pagehelper.PageInfo;
import com.zjw.domain.SysLog;
import com.zjw.service.ISysLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/22
 */
@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Resource
    private ISysLogService sysLogService;

    @RequestMapping("/findAllWithPage.do")
    public ModelAndView findAllWithPage(@RequestParam("page") Integer page, @RequestParam("size") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView("syslog-list");
        List<SysLog> sysLogList = sysLogService.findAllWithPage(page,size);
        PageInfo<SysLog> pageInfo = new PageInfo<>(sysLogList);
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
}
