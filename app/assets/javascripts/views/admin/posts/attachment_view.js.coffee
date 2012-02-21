$ ->
  PostsApp.AttachmentView = Backbone.View.extend
    template:
      JST["templates/admin/posts/attachment"]

    render: ->
      this.$el.html(this.template(this.options))
      this

