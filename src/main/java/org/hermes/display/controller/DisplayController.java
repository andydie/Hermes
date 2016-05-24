package org.hermes.display.controller;

import org.hermes.common.bean.Result;
import org.hermes.display.bean.Article;
import org.hermes.display.service.DisplayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Cabeza on 2016-05-24.
 */
@Controller
@RequestMapping("/display")
public class DisplayController {
    @Autowired
    DisplayService displayService;

    @ResponseBody
    @RequestMapping("article/ajax/queryArticle")
    public List<Article> queryArticle(){
        return displayService.queryArticle();
    }

    @ResponseBody
    @RequestMapping("article/ajax/queryArticleById/{articleId}")
    public Article queryArticleById(@PathVariable String articleId){
        return displayService.queryArticleById(articleId);
    }

    @ResponseBody
    @RequestMapping("article/ajax/saveArticle")
    public Result saveArticle(@RequestBody Article article){
        return displayService.saveArticle(article);
    }

    @ResponseBody
    @RequestMapping("article/ajax/updateArticle")
    public Result updateArticle(@RequestBody Article article){
        return displayService.updateArticle(article);
    }

    @ResponseBody
    @RequestMapping("article/ajax/deleteArticleById/{articleId}")
    public Result deleteArticleById(@PathVariable String articleId){
        return displayService.deleteArticleById(articleId);
    }

    @RequestMapping("article/create")
    public String gotoSaveArticle(){
        return "display/createArticle";
    }

    @RequestMapping("article/list")
    public String gotoArticleList(){
        return "display/articleList";
    }

    @RequestMapping("article/edit")
    public String gotoArticleEdit(){
        return "display/articleEdit";
    }
}
