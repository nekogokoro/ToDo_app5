<template>
  <el-form :model="toDo">
    <el-form-item label="">
      <el-input
        v-model="toDo.title"
        placeholder="タイトルを入力"
        name="to_do[title]"></el-input>
    </el-form-item>
    <el-form-item label="">
      <el-date-picker
        type="datetime"
        format="yyyy/MM/dd HH:mm"
        value-format="yyyy/MM/dd HH:mm"
        placeholder="期限を選択"
        v-model="toDo.expiredAt"
        name="to_do[expired_at]"></el-date-picker>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="createToDo">登録</el-button>
      <el-button @click="$emit('close')">キャンセル</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import axios from 'axios'

 export default {
   data() {
     return {
       toDo: {
         title: '',
         expiredAt: '',
         finished: false
       }
     }
   },
   methods: {
    createToDo() {
      axios.post('/api/v1/to_dos', {to_do: {title: this.toDo.title, expired_at: this.toDo.expiredAt}})
        .then(res => {
          switch (res.status) {
            case 201:
              this.$emit('add', res.data)
              this.toDo = {title: '', expiredAt: ''}
              this.$emit('close')
              break;
            }
         });
       }
   }
 }
</script>