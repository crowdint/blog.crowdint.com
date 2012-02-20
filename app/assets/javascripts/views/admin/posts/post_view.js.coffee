$ ->
  PostsApp.PostView = Backbone.View.extend
    tagName: 'tr'

    events:
      'click .delete' : 'deletePost'
      'click .publish' : 'togglePublish'

    template:
      JST["templates/admin/posts/post"]

    render: ->
      this.$el.html(this.template({post: this.model.toJSON(), publisher: PostsApp.publisher}))
      this.paintButtons()
      this

    deletePost: ->
      e.preventDefault()
      if confirm('Are you sure?')
        this.model.destroy()

    togglePublish: (e) ->
      e.preventDefault()

      if this.model.get('published?')
        this.model.save
          transition: 'draft'
        this.model.set('published?', false)
      else
        this.model.save
          transition: 'publish'
        this.model.set('published?', true)

      this.paintButtons()

    paintButtons: ->
      this.$el.find('.publish').removeClass('btn-success btn-danger')
      this.$el.find('.publish').addClass('btn-success') if this.model.get('published?')
      this.$el.find('.publish').addClass('btn-danger') unless this.model.get('published?')

