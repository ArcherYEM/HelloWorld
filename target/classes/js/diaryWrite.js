
$(document).ready(function() {
	
	function multiFiles(input) {
		  var previewContainer = document.getElementById('preview-container');

		  if (input && input.length) {
		    for (var i = 0; i < input.length; i++) {
		      (function(file) {
		        var reader = new FileReader();
		        
		        reader.onload = function(e) {
		          var newDiv = document.createElement("div");
		          newDiv.className = "image-container";

		          var newImg = document.createElement("img");
		          newImg.src = e.target.result;
		          newImg.style.width = "280px";
		          newImg.style.height = "200px";

		          var imageName = document.createTextNode(file.name);

		          newDiv.appendChild(newImg);
		          newDiv.appendChild(imageName);

		          previewContainer.appendChild(newDiv);
		        };

		        reader.readAsDataURL(file);
		      })(input[i]);
		    }
		  }
		}

		
		var oEditors=[];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "txtContent",
			sSkinURI : "../../../../resources/smarteditor2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
});