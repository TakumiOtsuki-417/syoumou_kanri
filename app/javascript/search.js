    console.log("成功してる？");
  $("#search_result").html("<%= j(render partial: 'shared/search', locals: {item: item, rest: @rest}) %>");
  $('#task-form').html("<%= j (render 'shared/search') %>");