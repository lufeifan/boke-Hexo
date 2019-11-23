{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ page.title }} | {{ title }}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  
  <div id="posts" class="posts-expand">
    {{ partial('_macro/post.swig', {post: page}) }}
  </div>

  <div>
  {% if not is_index %}
    {% include 'passage-end-tag.swig' %}
  {% endif %}     
</div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
