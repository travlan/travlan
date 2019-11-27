<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
    <main class="page blog-post">
        <section class="clean-block clean-post dark">
            <div class="container">
                <div class="block-content">
                    <div class="post-image" style="background-image:url(storage/photo_thumbnail/${post.thumbnail});"></div>
                    <div class="post-body">
                        <h3>${post.title}</h3>
                        <div class="post-info"><span>By ${author.nickname}</span><span>${post.created_date}</span></div>
                        <p>${post.content}</p>
                        <figure class="figure"></figure>
                    </div>
                </div>
            </div>
        </section>
    </main>