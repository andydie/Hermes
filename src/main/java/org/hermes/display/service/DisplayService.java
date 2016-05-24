package org.hermes.display.service;

import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.hermes.display.bean.Article;
import org.n3r.eql.Eql;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Cabeza on 2016-05-24.
 */
@Service
public class DisplayService {

    public List<Article> queryArticle() {
        return new Eql().returnType(Article.class).execute();
    }

    public Article queryArticleById(String articleId){
        return new Eql().selectFirst("queryArticleById").params(Collections.asMap("articleId",articleId)).returnType(Article.class).execute();
    }

    public Result saveArticle(Article article) {
        int result = new Eql().insert("saveArticle").params(article).execute();
        if (result > 0)
            return Result.build("1", "发表成功");
        return Result.build("0", "发表失败");
    }

    public Result updateArticle(Article article) {
        int result = new Eql().update("updateArticle").params(article).execute();
        if (result > 0) {
            return Result.build("1", "更新成功");
        }
        return Result.build("0", "更新失败");
    }

    public Result deleteArticleById(String articleId) {
        int result = new Eql().delete("deleteArticleById").params(Collections.asMap("articleId", articleId)).execute();
        if (result > 0) {
            return Result.build("1", "删除成功");
        }
        return Result.build("0", "删除失败");
    }
}
