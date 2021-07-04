<template>
  <q-layout view="hHh lpR fFf">

    <q-header elevated class="bg-primary text-white">
      <q-toolbar>
        <!-- <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" /> -->

        <q-toolbar-title>
          <q-avatar icon="mdi-chef-hat"></q-avatar>
          Recipes
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <!-- <q-drawer v-model="leftDrawerOpen" side="left" overlay bordered>
      <q-list>
        <q-item clickable v-ripple v-for="item in pageList" :key="item.id" :to="{name: item.route}">
          <q-item-section avatar>
            <q-icon color="primary" :name="item.icon"></q-icon>
          </q-item-section>
          <q-item-section>{{item.name}}</q-item-section>
        </q-item>
      </q-list>
    </q-drawer> -->

    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template>

<script>
import { ref } from 'vue'

export default {
  setup () {
    const pageList = ref([
      { name: 'Recipe List', icon: 'fas fa-pizza-slice', route: 'recipeList', id: 0 },
      { name: 'Sources', icon: 'fas fa-book', route: 'sourceList', id: 1 }
    ])
    const leftDrawerOpen = ref(false)
    return {
      leftDrawerOpen,
      pageList,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  }
}
</script>
