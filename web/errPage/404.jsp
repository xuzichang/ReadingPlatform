<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/24
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>

<link type="text/css" rel="stylesheet" href="stylesheets/style_for_404.css">
<div class="notfound">
<div class="text-box">
    <div class="status-code">
        <p>4</p>
        <div class="zero">
            <div class="zero__top">
                <div class="zero__top-inner"></div>
            </div>
            <div class="zero__bottom">
                <div class="zero__bottom-inner"></div>
            </div>
            <div class="sori-santa">
                <div class="santa santa--sori">
                    <div class="santa__hat">
                        <div class="santa__hat-part"></div>
                        <div class="santa__hat-part"></div>
                    </div>
                    <div class="santa__face">
                        <div class="santa__eyebrows santa__eyebrows--right"></div>
                        <div class="santa__eyebrows santa__eyebrows--left"></div>
                        <div class="santa__eye santa__eye--right"></div>
                        <div class="santa__eye santa__eye--left"></div>
                        <div class="santa__nose"></div>
                        <div class="santa__cheek santa__cheek--right"></div>
                        <div class="santa__cheek santa__cheek--left"></div>
                        <div class="santa__beard">
                            <div class="santa__beard-part"></div>
                            <div class="santa__beard-part"></div>
                            <div class="santa__beard-part"></div>
                        </div>
                        <div class="santa__mouth"></div>
                    </div>
                    <div class="santa__body">
                        <div class="santa__body-top"></div>
                        <div class="santa__hand santa__hand--left">
                            <div class="santa__hand-inner"></div>
                        </div>
                        <div class="santa__hand santa__hand--right"></div>
                        <div class="santa__body-bottom">
                            <div class="santa__foot santa__foot--left">
                                <div class="santa__foot-inner"></div>
                            </div>
                            <div class="santa__foot santa__foot--right">
                                <div class="santa__foot-inner"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="lead">
                    <div class="lead-inner"></div>
                </div>
                <div class="lead lead--back">
                    <div class="lead-inner"></div>
                </div>
                <div class="sori"></div>
                <div class="reindeer">
                    <div class="reindeer__face">
                        <div class="reindeer__ear"></div>
                        <div class="reindeer__horn reindeer__horn--right"></div>
                        <div class="reindeer__horn reindeer__horn--left"></div>
                    </div>
                    <div class="reindeer__body">
                        <div class="reindeer__foot reindeer__foot--front">
                            <div class="reindeer__foot-inner"></div>
                        </div>
                        <div class="reindeer__foot reindeer__foot--back">
                            <div class="reindeer__foot-inner"></div>
                        </div>
                        <div class="reindeer__tail"></div>
                    </div>
                </div>
            </div>
        </div>
        <p>4</p>
    </div>
    <div class="text">
        <p class="text__error">页面走丢了_(._.)_</p>
        <p class="text__error">
            <span>M</span><span>e</span><span>r</span><span>r</span><span>y</span><span>C</span><span>h</span><span>r</span><span>i</span><span>s</span><span>t</span><span>m</span><span>a</span><span>s</span>
        </p>
        <p class="text__error">Santa Claus works hard!</p>
    </div>
</div>

<div class="house house--first-floor">
    <div class="santa santa--chimney">
        <div class="santa__hat">
            <div class="santa__hat-part"></div>
            <div class="santa__hat-part"></div>
        </div>
        <div class="santa__face">
            <div class="santa__eyebrows santa__eyebrows--right"></div>
            <div class="santa__eyebrows santa__eyebrows--left"></div>
            <div class="santa__eye santa__eye--right"></div>
            <div class="santa__eye santa__eye--left"></div>
            <div class="santa__nose"></div>
            <div class="santa__cheek santa__cheek--right"></div>
            <div class="santa__cheek santa__cheek--left"></div>
            <div class="santa__beard">
                <div class="santa__beard-part"></div>
                <div class="santa__beard-part"></div>
                <div class="santa__beard-part"></div>
            </div>
            <div class="santa__mouth"></div>
        </div>
        <div class="santa__body">
            <div class="santa__body-top"></div>
            <div class="santa__hand santa__hand--left">
                <div class="santa__hand-inner"></div>
            </div>
            <div class="santa__hand santa__hand--right"></div>
            <div class="santa__body-bottom">
                <div class="santa__foot santa__foot--left">
                    <div class="santa__foot-inner"></div>
                </div>
                <div class="santa__foot santa__foot--right">
                    <div class="santa__foot-inner"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="lease">
        <div class="lease__ribbon"></div>
        <div class="lease__decoration">
            <div class="lease__decoration-part"></div>
            <div class="lease__decoration-part"></div>
            <div class="lease__decoration-part"></div>
        </div>
    </div>
    <div class="house__chimney">
        <div class="snow"></div>
    </div>
    <div class="house__bottom">
        <div class="house__roof house__roof--triangle">
            <div class="snow"></div>
        </div>
        <input class="input-toggle" id="toggle" type="checkbox">
        <label class="house-toggle" for="toggle"><span class="house__window"><span class="cat"><span class="cat__face"></span><span class="cat__body"></span></span><span class="present"><span class="present__ribbon"></span></span></span></label>
        <div class="house__door"></div>
    </div>
</div>

<div class="house house--second-floor">
    <div class="snowman">
        <div class="hukidashi hukidashi--speak">
            <p>Click on the window</p>
        </div>
        <div class="snowman__body">
            <div class="snowman__hat"></div>
            <div class="snowman__face"></div>
            <div class="snowman__hand snowman__hand--right"></div>
            <div class="snowman__hand snowman__hand--left"></div>
            <div class="snowman__scarf"></div>
        </div>
    </div>
    <div class="house__chimney">
        <div class="snow"></div>
    </div>
    <div class="house__bottom">
        <div class="house__roof house__roof--trapezoid">
            <div class="snow"></div>
        </div>
        <input class="input-toggle" id="toggle2" type="checkbox">
        <label class="house-toggle" for="toggle2"><span class="house__window"><span class="tree"><span class="tree__body"></span><span class="tree__decorations"><span class="tree__decoration"></span><span class="tree__decoration"></span><span class="tree__decoration"></span><span class="tree__decoration"></span><span class="tree__decoration"></span><span class="tree__decoration"></span></span></span></span></label>
        <div class="house__door"></div>
    </div>
    <div class="house__top">
        <div class="house__roof house__roof--triangle">
            <div class="snow"></div>
        </div>
        <input class="input-toggle" id="toggle3" type="checkbox">
        <label class="house-toggle" for="toggle3"><span class="house__window"></span></label>
    </div>
</div>

<div class="santa santa--walk">
    <div class="hukidashi hukidashi--speak">
        <p>Where?</p>
    </div>
    <div class="sweat"></div>
    <div class="sweat"></div>
    <div class="santa__hat">
        <div class="santa__hat-part"></div>
        <div class="santa__hat-part"></div>
    </div>
    <div class="santa__face">
        <div class="santa__eyebrows santa__eyebrows--right"></div>
        <div class="santa__eyebrows santa__eyebrows--left"></div>
        <div class="santa__eye santa__eye--right"></div>
        <div class="santa__eye santa__eye--left"></div>
        <div class="santa__nose"></div>
        <div class="santa__cheek santa__cheek--right"></div>
        <div class="santa__cheek santa__cheek--left"></div>
        <div class="santa__beard">
            <div class="santa__beard-part"></div>
            <div class="santa__beard-part"></div>
            <div class="santa__beard-part"></div>
        </div>
        <div class="santa__mouth"></div>
    </div>
    <div class="santa__body">
        <div class="santa__body-top"></div>
        <div class="santa__hand santa__hand--left">
            <div class="santa__hand-inner"></div>
        </div>
        <div class="santa__hand santa__hand--right"></div>
        <div class="santa__body-bottom">
            <div class="santa__foot santa__foot--left">
                <div class="santa__foot-inner"></div>
            </div>
            <div class="santa__foot santa__foot--right">
                <div class="santa__foot-inner"></div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="../footer.jsp"%>