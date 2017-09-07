#Pre: takes in the button that calls this function
#Post: moves the parent element of the button above the previous element
#as long as they are the same type
#Purpose: this function is meant to help reorganize elements of different templates
@moveUp = (button) ->
  prevElement = $(button.parentElement).prev()
  #if the element previous to the one selected is of the same type then we will move our element before it
  if $(button.parentElement).prop("class") is $(prevElement).prop("class")
    $(button.parentElement).detach().insertBefore(prevElement)
  return

#Pre: takes in the button that calls this function
#Post: moves the parent element of the button below the next element
#as long as they are the same type
#Purpose: this function is meant to help reorganize elements of different templates
@moveDown = (button) ->
  nextElement = $(button.parentElement).next()
  if $(button.parentElement).prop("class") is $(nextElement).prop("class")
    $(button.parentElement).detach().insertAfter(nextElement)
  return

@addRemodalInput = (button) ->
  $('<div class="input-container">
       <input class="remodal-input" type="text" />
       <a class="btn" onclick="addRemodalInput(this)">+</a>
       <a class="btn" onclick="deleteRemodalInput(this)">&minus;</a>
       <a class="btn" onclick="moveUp(this)">&uarr;</a>
       <a class="btn" onclick="moveDown(this)">&darr;</a>
     </div>').insertAfter(button.parentElement)
  return

@deleteRemodalInput = (button) ->
  className = $(button.parentElement).prop('class')
  if button.parentElement.parentElement.getElementsByClassName(className).length - 1
    button.parentElement.remove()
  return