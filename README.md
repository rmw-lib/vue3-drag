<!-- 本文件由 ./make.md 自动生成，请不要直接修改此文件 -->

# @rmw/vue3-drag

---

![](./demo.webp)

## English Readme

a drag and resizeable vue3 component

[demo link](https://rmw-lib.github.io/vue3-drag/)

The component itself does not contain styles, see `src/index.vue` for demo page styles

### install

```
yarn add -D @rmw/vue3-drag
```

### use

```js
import Drag from '@rmw/vue3-drag'
import '@rmw/vue3-drag/drag.css'
```

```vue
<template lang="pug">
main
  drag(:minH="150" :minW="100" :move="move" ref="drag")
    b
      i
        b(v-for="(v, k) in meta") {{ k }} {{ v }}
        a(href="https://github.com/rmw-lib/vue3-drag" target="_blank")
</template>

<script lang="coffee">
import Drag from './com/drag.vue'
export default {
components:{
  Drag
}
setup:=>
  meta = ref()
  drag = shallowRef()
  onMounted =>
    {clientHeight:height, clientWidth:width, offsetLeft:left, offsetTop:top} = elem = drag.value.i
    meta.value = {
      top
      left
      width
      height
    }
    (
      new ResizeObserver (li)=>
        for {target:{clientHeight:height,clientWidth:width}} from li
          Object.assign meta.value, {
            width
            height
          }
          break
        return
    ).observe elem

    return
  {
    drag
    meta
    move:({offsetLeft, offsetTop},x,y)=>
      Object.assign meta.value, {
        left:offsetLeft+x
        top:offsetTop+y
      }
      return
  }
}
</script>

<style lang="stylus">
@import './styl/init.styl'
</style>

<style lang="stylus" scoped>
main
  display flex
  flex 1
  background url(':/svg/bg.svg') 0 0 / cover no-repeat
  height 100%

  &>i
    width 200px
    height 250px
    margin-top 50px
    margin-left 50px
    display flex
    position relative

    &:before
      display flex
      flex 1
      content ''
      border 0 solid rgba(0, 0, 0, 0.5)
      border-width 100vh 100vw
      margin -100vh -100vw
      position absolute
      width 100%
      height 100%
      box-sizing content-box
      pointer-events none
      z-index 0

    $space = 24px
    $circle_radius = 12px
    $space_circle_radius = $space + $circle_radius
    $border_width = 2px

    &>b
      background url(':/svg/o.svg'), url(':/svg/o.svg') 100% 0, url(':/svg/o.svg') 0 100%, url(':/svg/o.svg') 100% 100%, url(':/svg/o.svg') 50% 0, url(':/svg/o.svg') 50% 100%, url(':/svg/o.svg') 0 50%, url(':/svg/o.svg') 100% 50%
      background-repeat no-repeat
      background-size 2 * $circle_radius
      display flex
      flex 1
      margin -($space_circle_radius)
      padding $circle_radius
      position relative

      &:after, &:before
        content ''
        flex 1

      &:after
        position absolute
        box-sizing content-box
        border $border_width solid #fff
        margin: $circle_radius - $border_width
        left $space
        right $space
        bottom $space
        top $space

      &:before
        background url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' stroke='%23ff9e40' stroke-width='2' stroke-dasharray='6%2c 14' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e") 0 0 / contain no-repeat

      &>i
        top $space_circle_radius
        left @top
        right @top
        bottom @top
        user-select none
        position absolute
        display flex
        flex-direction column
        align-items center
        justify-content center
        z-index 1
        font-style normal

        &>a
          background url(':/svg/github.svg') 0 0 / cover
          height 32px
          width 32px
          margin-top 16px
          position relative

          &:hover
            &:after
              content ''
              background #fff
              width 100%
              height 100%
              position absolute
              border-radius 16px
              mix-blend-mode multiply
</style>
```

---

## 中文说明

一个可拖拽、调整大小的vue3组件

[演示链接](https://rmw-lib.github.io/vue3-drag/)

组件本身不包含样式，演示页面样式见 `src/index.vue`

### 安装

```
yarn add -D @rmw/vue3-drag
```

### 使用

```js
import {drag} from '@rmw/vue3-drag'
import '@rmw/vue3-drag/style.css'
```

```vue
<template lang="pug">
main
  drag(:minH="150" :minW="100" :move="move" ref="drag")
    b
      i
        b(v-for="(v, k) in meta") {{ k }} {{ v }}
        a(href="https://github.com/rmw-lib/vue3-drag" target="_blank")
</template>

<script lang="coffee">
import Drag from './com/drag.vue'
export default {
components:{
  Drag
}
setup:=>
  meta = ref()
  drag = shallowRef()
  onMounted =>
    {clientHeight:height, clientWidth:width, offsetLeft:left, offsetTop:top} = elem = drag.value.i
    meta.value = {
      top
      left
      width
      height
    }
    (
      new ResizeObserver (li)=>
        for {target:{clientHeight:height,clientWidth:width}} from li
          Object.assign meta.value, {
            width
            height
          }
          break
        return
    ).observe elem

    return
  {
    drag
    meta
    move:({offsetLeft, offsetTop},x,y)=>
      Object.assign meta.value, {
        left:offsetLeft+x
        top:offsetTop+y
      }
      return
  }
}
</script>

<style lang="stylus">
@import './styl/init.styl'
</style>

<style lang="stylus" scoped>
main
  display flex
  flex 1
  background url(':/svg/bg.svg') 0 0 / cover no-repeat
  height 100%

  &>i
    width 200px
    height 250px
    margin-top 50px
    margin-left 50px
    display flex
    position relative

    &:before
      display flex
      flex 1
      content ''
      border 0 solid rgba(0, 0, 0, 0.5)
      border-width 100vh 100vw
      margin -100vh -100vw
      position absolute
      width 100%
      height 100%
      box-sizing content-box
      pointer-events none
      z-index 0

    $space = 24px
    $circle_radius = 12px
    $space_circle_radius = $space + $circle_radius
    $border_width = 2px

    &>b
      background url(':/svg/o.svg'), url(':/svg/o.svg') 100% 0, url(':/svg/o.svg') 0 100%, url(':/svg/o.svg') 100% 100%, url(':/svg/o.svg') 50% 0, url(':/svg/o.svg') 50% 100%, url(':/svg/o.svg') 0 50%, url(':/svg/o.svg') 100% 50%
      background-repeat no-repeat
      background-size 2 * $circle_radius
      display flex
      flex 1
      margin -($space_circle_radius)
      padding $circle_radius
      position relative

      &:after, &:before
        content ''
        flex 1

      &:after
        position absolute
        box-sizing content-box
        border $border_width solid #fff
        margin: $circle_radius - $border_width
        left $space
        right $space
        bottom $space
        top $space

      &:before
        background url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' stroke='%23ff9e40' stroke-width='2' stroke-dasharray='6%2c 14' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e") 0 0 / contain no-repeat

      &>i
        top $space_circle_radius
        left @top
        right @top
        bottom @top
        user-select none
        position absolute
        display flex
        flex-direction column
        align-items center
        justify-content center
        z-index 1
        font-style normal

        &>a
          background url(':/svg/github.svg') 0 0 / cover
          height 32px
          width 32px
          margin-top 16px
          position relative

          &:hover
            &:after
              content ''
              background #fff
              width 100%
              height 100%
              position absolute
              border-radius 16px
              mix-blend-mode multiply
</style>
```

背景图是用 https://svgwave.in 创建

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)