$(document).on 'page:change', ->
  return unless $(".topics.new").length > 0
  simplemde = new SimpleMDE({
    autosave: {
      enabled: true,
      unique_id: "topicsNew",
      delay: 1000,
    },
    spellChecker: false,
  })

