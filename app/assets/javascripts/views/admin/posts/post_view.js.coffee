$ ->
  PostsApp.PostView = Backbone.View.extend
    tagName: 'tr'

    events:
      'click .delete' : 'deletePost'

    template:
      JST["templates/admin/posts/post"]

    render: ->
      this.$el.html(this.template({post: this.model.toJSON()}))
      this

    deletePost: ->
      if confirm('Are you sure?')
        this.model.destroy()
