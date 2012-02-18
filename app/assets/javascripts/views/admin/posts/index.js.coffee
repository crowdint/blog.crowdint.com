$ ->
  PostsApp.PostsIndexView = Backbone.View.extend
    template:
      JST["templates/admin/posts/index"]

    render: ->
      this.$el.html(this.template({title: 'title', posts: this.options.posts }))
      this

