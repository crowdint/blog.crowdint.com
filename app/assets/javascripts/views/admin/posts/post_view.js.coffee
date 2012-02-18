$ ->
  PostsApp.PostView = Backbone.View.extend
    tagName: 'tr'

    template:
      JST["templates/admin/posts/post"]

    render: ->
      this.$el.html(this.template({post: this.model.toJSON()}))
      this
