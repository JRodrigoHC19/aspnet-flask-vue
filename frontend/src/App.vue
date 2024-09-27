<script setup>
import { ref } from 'vue'
import axios from 'axios'

const ipAddress = ref('')
const cats = ref([])
const searchQuery = ref('')

const searchCats = async () => {
  if (!ipAddress.value) {
    alert('Por favor, ingresa una dirección IP válida.');
    return;
  }

  try {
    // Usar la IP ingresada manualmente
    const response = await axios.get(`http://${ipAddress.value}:8082/?query=${searchQuery.value}`)
    cats.value = response.data
    console.log(typeof response.data, response.data)
  } catch (error) {
    console.error('Error al consumir el API:', error)
  }
}
</script>

<template>
  <div class="container mt-4">
    <h1>Gatos</h1>

    <div class="mb-3">
      <input
        type="text"
        v-model="ipAddress"
        class="form-control"
        placeholder="Ingresa la dirección IP de la API"
      />
    </div>

    <div class="mb-3">
      <input
        type="text"
        v-model="searchQuery"
        class="form-control"
        placeholder="Buscar gatos..."
      />
      <button @click="searchCats" class="btn btn-primary mt-2">Buscar</button>
    </div>

    <table class="table table-striped" v-if="cats.length">
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Raza</th>
          <th>Personalidad</th>
          <th>Enlace</th>
          <th>Historia</th>
          <th>Descripción</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="cat in cats" :key="cat.Cat_Name">
          <td>{{ cat.Cat_Name }}</td>
          <td>{{ cat.Breed }}</td>
          <td>{{ cat.Personality_Trait }}</td>
          <td><a :href="cat.Image_Link" target="_blank">Más Información</a></td>
          <td>{{ cat.Backstory }}</td>
          <td>{{ cat.Description }}</td>
        </tr>
      </tbody>
    </table>

    <p v-else>No hay resultados.</p>
  </div>
</template>
