{{ $show = 12 }}

{{ if {get_var.p} }}
	{{ $skip = {get_var.p} }}
{{ else }}
	{{ $skip = 1 }}
{{ end-if }}
{{ each blog_post as blog }}
  {{ $postCount = {blog._length} }}
{{ end-each }}
{{ $totalPages = {math({$postCount} / 12)} }}

{{ include hero_featured }}

<div class="wrapper wrapper--96">
  <div class="grid--fluid">
    <div class="row vr__2x">
      <div class="col-xs-12">
        <ul class="gallery gallery__3up">
          {{ each blog_post as blog sort by publishdate desc limit {$skip}, {$show} }}
            <li>
              {{ include blog_article_preview }}
            </li>
            {{ $lastOne = {blog.zid} }}
          {{ end-each }}
        </ul>
      </div>
    </div>
    <div class="row vr__2x">
      <div class="col-xs-12">
      {{ include pagination }}
      </div>
    </div>
  </div>
</div>