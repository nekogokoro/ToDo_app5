<template>
  <el-tabs v-model="activeName">
  <el-tab-pane label="ToDo" name="toDo">
  <el-table
    :data="filter(toDos,false)"
    style="width: 100%">
     <el-table-column
      prop="finished">
      <template v-slot="scope">
        <el-checkbox
          v-model="scope.row.finished"
          @change="updateToDo(scope.row.id, scope.row.finished)">
        </el-checkbox>
      </template>
    </el-table-column>
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
   </el-tab-pane>
  <el-tab-pane label="終了したToDo" name="finishedToDo">
    <el-table
    :data="filter(toDos,true)"
    style="width: 100%">
     <el-table-column
      prop="finished">
      <template v-slot="scope">
        <el-checkbox
          v-model="scope.row.finished"
          @change="updateToDo(scope.row.id, scope.row.finished)">
        </el-checkbox>
      </template>
    </el-table-column>
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
  </el-tab-pane>
</el-tabs>
</template>
<script>
 import axios from 'axios'
 import {reject, filter} from 'lodash';
 
  export default {
  data() {
    return {
      toDos: [],
      activeName: 'ToDo'
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
      },
      updateToDo(id, finished) {
          axios.patch('/api/v1/to_dos/' + id, {to_do: {finished: finished}})
            .then(res => {
              if (res.status === 200) {
                console.log(res)
            }
          })
        },
      filter(toDos, finished) {
        return filter(toDos, ['finished', finished])
          }
      }
    }
</script>