package com.hbx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbx.pojo.Books;
import com.hbx.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@Controller
@RequestMapping("/book")
public class bookController {
    //controller 调 service 层
    @Autowired
    @Qualifier("BookServiceimpl")
    private BookService bookService;
    //查询全部的书籍，并且返回到一个书籍展示页面
    @RequestMapping("/allbook")
    private String list(@RequestParam(value = "pn",defaultValue = "1")Integer pn,HttpServletRequest request, Model model){
        //开启分页操作并设置页面最大数据量
        PageHelper.startPage(pn,5);
        //创建查询结果的集合

        String bookid = request.getParameter("getID");
        String name = request.getParameter("getName");
        int id = Integer.parseInt(bookid);
        List<Books> list = bookService.queryAllBook(id,name);
        PageInfo page = new PageInfo(list,5);
        model.addAttribute("pageInfo",page);
        return"allbook";
    }
    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPaper() {
        return "addBook";
    }
    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addPaper(Books books) {
        System.out.println("addBook=>"+books);
        bookService.addBook(books);
        return "redirect:/book/allbook";
    }
    //跳转到修改书籍页面
    @RequestMapping("/toUpdate")
    public String toUpdate(int id ,Model model) {
        Books books = bookService.queryBookById(id);
        System.out.println(books);
        model.addAttribute("QBook",books );
        return "updateBook";
    }
    //修改书籍的请求
    @RequestMapping("/updateBook")
    public String updteBook(Books books) {
        System.out.println("updateBook=>"+books);
        bookService.updateBook(books);
        return "redirect:/book/allbook";
    }
    //删除书籍
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allbook";
    }
    //跳转到查询书籍的页面
    @RequestMapping("/toqueryBook")
    public String toqueryBook(@RequestParam("id") int id , Model model) {
        Books books = bookService.queryBookById(id);
        System.out.println(books);
        model.addAttribute("QBook",books );
        return "queryBook";
    }
    //通过id查询书籍
    @RequestMapping("/queryBook")
    public String queryBook(){
        return "redirect:/book/allbook";
    }

}
