package com.zjw.controller;

import com.zjw.domain.SysLog;
import com.zjw.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author 朱俊伟
 * @date 2020/11/22
 */
@Component
@Aspect
public class LogAop {

    @Resource
    private HttpServletRequest request;

    @Resource
    private ISysLogService sysLogService;

    //开始时间
    private Date visitTime;

    //访问的类
    private Class clazz;

    //访问的方法
    private Method method;

    /**
     * 前置通知
     * 主要式获取开始时间，执行的类是哪一个，执行的方法是哪一个方法
     * @param jp
     */
    @Before("execution(* com.zjw.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        //当前时间就是开始访问的时间
        visitTime = new Date();
        //具体要访问的类
        clazz = jp.getTarget().getClass();
        //获取访问的方法名称
        String methodName = jp.getSignature().getName();
        //获取访问的方法的参数
        Object[] args = jp.getArgs();

        //获取具体执行的方法的Method对象
        if (args==null || args.length==0){
            method = clazz.getMethod(methodName);
        }else{
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName,classArgs);
        }


    }

    /**
     * 后置通知
     * @param jp
     */
    @After("execution(* com.zjw.controller.*.*(..))" )
    public void doAfter(JoinPoint jp) throws Exception {
        //获取访问时长
        long time = new Date().getTime() - visitTime.getTime();
        //获取url
        String url = "";
        if (clazz != null && method != null && clazz != LogAop.class){

            //如果是记录日志的controller就跳过
            if (clazz.getName().equals(SysLogController.class.getName()))
                return;

            String[] classValues = null;
            String[] methodValues = null;

            //获取类上的@RequestMapping
            RequestMapping clazzAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (clazzAnnotation != null){
                classValues = clazzAnnotation.value();
            }

            //获取方法上的@RequestMapping
            RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
            if (methodAnnotation != null){
                methodValues = methodAnnotation.value();
            }

            assert classValues != null;
            assert methodValues != null;
            url = classValues[0]+""+methodValues[0];

        }

        //获取访问的ip地址
        String ip = request.getRemoteAddr();

        //获取操作的用户
//        SecurityContext context = SecurityContextHolder.getContext();//方式一
        SecurityContext context = (SecurityContext) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");//方式二
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();

        //将日志信息封装到SysLog对象
        SysLog sysLog = new SysLog();
        sysLog.setExecutionTime(time);
        sysLog.setIp(ip);
        sysLog.setMethod("[类名] "+clazz.getName() + "[方法名] " + method.getName());
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(visitTime);

        sysLogService.saveSysLog(sysLog);

    }


}
