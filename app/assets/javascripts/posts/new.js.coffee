$(document).on 'page:change', ->
  return unless $(".posts.new").length > 0
  simplemde = new SimpleMDE({
    autofocus: true,
    autosave: {
      enabled: true,
      unique_id: "postsNew",
      delay: 1000,
    },
    spellChecker: false,
  })


