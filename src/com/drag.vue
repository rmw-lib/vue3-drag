<template lang="pug">
i(:style="style" ref="i")
  slot
</template>

<style lang="stylus" scoped>
i
  touch-action none
</style>

<script lang="coffee">
import interact from 'interactjs'

export default {
props:{
  minH:Number
  minW:Number
  move:Function
  style:{
    type:Object
    default:=>{}
  }
}
setup:({minH,minW,move})=>
  i = shallowRef()
  onMounted =>
    data_x = 'x'
    data_y = 'y'
    round = Math.round
    floor = Math.floor
    _move = (target,left,top)=>
      left = round left
      top = round top

      if left or top
        x = floor(target.getAttribute(data_x)) or 0
        y = floor(target.getAttribute(data_y)) or 0
        # translate when resizing from top or left edges
        x += left
        y += top
        target.style.transform = 'translate(' + x + 'px,' + y + 'px)'
        target.setAttribute data_x, x
        target.setAttribute data_y, y
        move?(target,x,y)
      return

    interact(i.value).resizable(
      edges:
        left: true
        right: true
        bottom: true
        top: true
      listeners: move: (event) =>
        {target,rect:{width,height},deltaRect:{left,top}} = event
        width = round(width)
        height = round(height)
        # update the element's style
        Object.assign target.style,{
          width:width+'px'
          height:height+'px'
        }
        _move target,left,top
        # target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height)
        return
      modifiers: [
        interact.modifiers.restrictEdges(outer: 'parent')
        interact.modifiers.restrictSize(
          min:
            width: minW
            height: minH
        )
      ]
      inertia: true
    ).draggable(
      listeners: move:  ({target,dx,dy}) =>
        _move target,dx,dy
        return
      inertia: true
      modifiers: [
        interact.modifiers.restrictRect(
          restriction: 'parent'
          endOnly: true
        )
      ]
    )
    return
  {
    i
  }

}
</script>
