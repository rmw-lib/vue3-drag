export default (div,index,...args)=>
  app = createApp(index,...args)
  app.mount(div)
  app

