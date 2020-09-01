<template>
  <el-table
    :data="toDos"
    style="width: 100%">
    <el-table-column
      prop="title"
      width="180">
    </el-table-column>
    <el-table-column
      prop=""
      width="180">
    </el-table-column>
    <el-table-column
      prop="expired_at"
      label="">
    </el-table-column>
    <el-table-column
　　  width="120">
　　   <template v-slot="scope">
   　　  <el-button
      　　@click="destroyToDo(scope.row.id)"
         type="danger"
         icon="el-icon-delete"
         circle>
        </el-button>
　　   </template>
    </el-table-column>
  </el-table>
</template>
<script>
 import axios from 'axios'
 import {reject} from 'lodash';
 
  export default {
  data() {
    return {
      toDos: []
      }
    },
  created() {
    axios.get('/api/v1/to_dos')
       .then(res => {
         this.toDos = res.data
       })
    },
  methods: {
    destroyToDo(id) {
      axios.delete('/api/v1/to_dos/' + id)
        .then(res => {
          if (res.status === 200) {
            this.toDos = reject(this.toDos, ['id', id]);
          }
        });
      }
    }
  } 
</script>