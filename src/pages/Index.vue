<template>
  <q-page class="q-col-gutter-md" padding>
    <div class="col q-col-gutter-md">
      <q-select use-chips multiple v-model='sourceSearchList' :options='sourceListOptions' label='Source' style="max-width: 700px" dense outlined use-input @filter="filterFnSources">
        <template v-slot:option="scope">
          <q-item v-bind="scope.itemProps" dense>
            <q-item-section avatar>
              <q-avatar>
                <q-img :src="'https://raw.githubusercontent.com/GarethChester/recipes-server-251/master/src/assets/source-icons/' + scope.opt.value + '.png'"></q-img>
              </q-avatar>
            </q-item-section>
            <q-item-section>
              {{scope.opt.label}}
            </q-item-section>
          </q-item>
        </template>
      </q-select>
      <q-input v-model='searchText' label='Search' outlined style="max-width: 700px" dense>
        <template v-slot:prepend>
          <q-icon name="search"></q-icon>
        </template>
      </q-input>
      <q-list>
        <q-item v-for="item in recipeListFiltered" :key="item.id" style="max-width: 700px">
          <q-item-section top avatar clickable v-ripple @click="toggleSource(item)" style="cursor:pointer">
            <q-avatar>
              <q-img :src="'https://raw.githubusercontent.com/GarethChester/recipes-server-251/master/src/assets/source-icons/' + item.sourceid + '.png'"></q-img>
            </q-avatar>
          </q-item-section>
          <q-item-section clickable v-ripple style="cursor:pointer">
            <q-item-label>{{item.name}}</q-item-label>
            <q-item-label caption lines="1">{{item.source}} {{item.page ? 'p.' + item.page : ''}}</q-item-label>
          </q-item-section>
          <q-item-section top avatar v-if="item.url">
            <q-btn round color="primary" icon="mdi-link" type="a" :href="item.url" target="_blank"></q-btn>
          </q-item-section>
        </q-item>
      </q-list>
    </div>
  </q-page>
</template>

<script>
const sourceList = [
  { label: 'The Guardian', value: 1 },
  { label: 'Test Book', value: 2 }
]
export default ({
  data () {
    return {
      pageName: 'Recipes',
      recipeList: [
        { id: 1, name: 'Asparagus Quiche', source: 'Test Book', sourceid: 2, page: 32 },
        { id: 2, name: 'Chickpea Curry', source: 'The Guardian', sourceid: 1, url: 'https://www.theguardian.com/lifeandstyle/2013/oct/09/jack-monroe-aubergine-chickpea-curry-recipe' },
        { id: 3, name: 'Salmon Quiche', source: 'Test Book', sourceid: 2, page: 33 }
      ],
      searchText: '',
      sourceSearchList: [],
      sourceListOptions: []
    }
  },
  computed: {
    recipeListFiltered: function () {
      let obj = this.recipeList
      obj = this.sourceSearchList.length > 0
        ? obj.filter(s => this.sourceSearchList.map(t => t.value).includes(s.sourceid))
        : obj
      const search = this.searchText.split(' ').filter(s => s.length > 0)
      obj = this.searchText.length > 0
        ? obj.filter(s => search.some(t => { return s.name.toLowerCase().indexOf(t.toLowerCase()) >= 0 }))
        : obj
      return obj
    }
  },
  methods: {
    filterFnSources: function (val, update) {
      update(() => {
        this.filterFn(sourceList, 'sourceListOptions', val)
      })
    },
    filterFn (source, destination, val) {
      console.log(val.length)
      if (val.length === 0) {
        this[destination] = source
      } else {
        const needle = val.toLowerCase()
        this[destination] = source.filter(s => s.label.toLowerCase().indexOf(needle) > -1)
      }
    },
    toggleSource: function (source) {
      console.log(source.sourceid)
      if (this.sourceSearchList.map(s => s.value).includes(source.sourceid)) {
        console.log('a')
        this.sourceSearchList = this.sourceSearchList.filter(s => s.value !== source.sourceid)
      } else {
        console.log('b')
        this.sourceSearchList.push({ label: source.source, value: source.sourceid })
      }
    }
  }
})

</script>
