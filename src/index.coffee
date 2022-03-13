import mount from '~/lib/mount.coffee'
import index from '~/index.vue'

doc = document
div = doc.createElement 'p'
doc.body.appendChild(div)

mount div,index
