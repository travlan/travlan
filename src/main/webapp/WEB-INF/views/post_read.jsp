<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<<<<<<< HEAD
<<<<<<< HEAD
 <main class="page blog-post">
    <section class="clean-block clean-post dark">
        <div class="container">
            <div class="block-content">
                <div class="post-image" style="background-image:url(storage/photo_thumbnail/${post.thumbnail});"></div>
                <div class="post-body">
                    <h3>${post.title}</h3>
                    <div class="post-info"><span>By ${author.nickname}</span><span>${post.created_date}</span><button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#exampleModal" onclick="scrap()">스크랩</button></div>
                    <p>${post.content}</p>
                    <figure class="figure"></figure>
=======
=======
>>>>>>> 9d5acda7a282e921bc7966976a11da319565596f
 	<link rel="stylesheet" href="assets/css/read.css">
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
>>>>>>> 9d5acda7a282e921bc7966976a11da319565596f
                </div>
            </div>
        </div>
    </section>
</main>