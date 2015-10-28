$(document).on 'page:change', ->
  return unless $(".posts.edit").length > 0
  simplemde = new SimpleMDE({
    autofocus: true,
    autosave: {
      enabled: true,
      unique_id: "postsEdit",
      delay: 1000,
    },
    spellChecker: false,
  })

