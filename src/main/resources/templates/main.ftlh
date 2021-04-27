<#import "parts/common.ftlh" as c>


<@c.page>

    <form method="get" action="/main" class="row row-cols-lg-auto g-2 align-items-center mb-3">
        <div class="col-12">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
    </form>
    <div class="input-group mb-3">
    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    </div>

    <div class="collapse" id="collapseExample">
        <div class="input-group mb-2">
            <form method = "post" enctype="multipart/form-data">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" name="text" placeholder="Введите сообщение"/>
                </div>

                <div class="input-group mb-2">
                    <input type="text" class="form-control" name="tag" placeholder="Тэг">
                </div>

                <div class="input-group mb-2">
                    <input type="file" class="form-control" name="file">
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <div class="input-group mb-2">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-2">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
        </div>
    <#else>
        No messages
    </#list>
    </div>
</@c.page>