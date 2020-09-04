<template>
  <div id="app">
    <el-form
      :model="toDo"
      :action="toDo.action"
      method="post">
      <el-form-item>
        <el-input
          type="hidden"
          :value="toDo.csrfToken"
          name="authenticity_token">
        </el-input>
      </el-form-item>
     <el-form-item>
        <el-input
          v-model="toDo.title"
          name="to_do[title]">
        </el-input>
      </el-form-item>
      <el-form-item>
        <el-date-picker
          type="datetime"
          format="yyyy/MM/dd HH:mm"
          value-format="yyyy/MM/dd HH:mm"
          placeholder="期限を選択"
          v-model="toDo.expiredAt"
          name="to_do[expired_at]">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          native-type="submit">作成
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        toDo: {
          csrfToken: document.getElementsByName('csrf-token')[0].content,
          title: '',
          expiredAt: '',
          action: '/to_dos'
        }
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
