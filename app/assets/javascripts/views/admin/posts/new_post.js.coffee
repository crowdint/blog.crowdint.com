$ ->
  PostsApp.NewPostView = Backbone.View.extend
    events:
      'click .save' : 'savePost'
      'click .cancel' : 'cancelPost'

    template:
      JST['templates/admin/posts/new']

    render: ->
      this.$el.html(this.template())
      this

    savePost: (e) ->
      e.preventDefault()
      PostsApp.Posts.create(this.extractData())
      this.goHome()

    cancelPost: (e) ->
      e.preventDefault()
      this.goHome()

    extractData: ->
      {
        'title' : this.$el.find('#post_title').val(),
        'body'  : this.$el.find('#post_body').val()
      }


    clearFields: ->
      this.$el.find('#post_title').val('')
      this.$el.find('#post_body').val('')

    goHome: ->
      PostsApp.router.navigate ''
        trigger: true
