<template>
  <q-page class="q-col-gutter-md" padding>
    <div class="q-text-h4">Recipe List</div>
    <div id="app">
      <q-list>
        <q-item v-for="item in recipeListFiltered" :key="item.id">
          <q-item-section top avatar clickable v-ripple>
            <q-avatar>
            </q-avatar>
          </q-item-section>
          <q-item-section clickable v-ripple>
            <q-item-label>{{item.name}}</q-item-label>
            <q-item-label caption lines="1">{{item.source}} {{item.page ? 'p.' + item.page : ''}}</q-item-label>
          </q-item-section>
          <q-item-section top v-if="item.url">
            <q-btn round color="primary" icon="mdi-link" type="a" :href="item.url" target="_blank"></q-btn>
          </q-item-section>
        </q-item>
      </q-list>
    </div>
  </q-page>
</template>

<script>
export default ({
  data () {
    return {
      pageName: 'Recipes',
      recipeList: [
        { id: 1, name: 'Asparagus Quiche', source: 'Test Book', sourceid: 2, page: 32 },
        { id: 2, name: 'Chickpea Curry', source: 'The Guardian', sourceid: 1, url: 'https://www.theguardian.com/lifeandstyle/2013/oct/09/jack-monroe-aubergine-chickpea-curry-recipe' },
        { id: 3, name: 'Salmon Quiche', source: 'Test Book', sourceid: 2, page: 33 }
      ]
    }
  },
  computed: {
    recipeListFiltered: function () {
      return this.recipeList
    }
  }
})

</script>
