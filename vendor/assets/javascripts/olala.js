var Olala = {
  init: function () {
    if (this.isAdmin()) {
      this.initAloha();
    }
  },

  isAdmin: function () {
    return true;
    return $('body').hasClass('admin');
  },

  initAloha: function () {
    Aloha.ready(function () {
      Aloha.jQuery('.editable').aloha();
      Aloha.require(['aloha', 'aloha/jquery'], function (Aloha, jQuery) {

        // save all changes after leaving an editable
        Aloha.bind('aloha-editable-deactivated', function () {
          var content = Aloha.activeEditable.getContents();
          var contentId = Aloha.activeEditable.obj[0].id;
          var pageId = window.location.pathname;

          // textarea handling -- html id is "xy" and will be "xy-aloha" for the aloha editable
          if (contentId.match(/-aloha$/gi)) {
            contentId = contentId.replace(/-aloha/gi, '');
          }

          console.log({content: content, id: contentId, pageId: pageId});

          var data = {label: Aloha.activeEditable.obj.data('label')};
          data['content'] = content;
          $.ajax({
            type: "POST",
            url: '/olala/labels',
            data: data,
            success: function () {
              console.log('success', 'Modifications enregistrées');
            },
            failure: function () {
              console.log('error', "Impossible d'enregistrer les modifications (1)");
            },
            error: function () {
              console.log('error', "Impossible d'enregistrer les modifications (2)");
            }
          });
        });

      });
    });
  }
};

$(function () {
  Olala.init();
});
