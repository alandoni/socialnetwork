package com.adqmobile.socialnetwork.data.local

import androidx.room.TypeConverter
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

class DatabaseMapConverter {
    var gson = Gson()

    @TypeConverter
    fun stringToMap(data: String?): Map<String, Int> {
        if (data == null) {
            return HashMap()
        }

        val listType = object : TypeToken<Map<String, Int>>() { }.getType()

        return gson.fromJson<Map<String, Int>>(data, listType)
    }

    @TypeConverter
    fun mapToString(map: Map<String, Int>): String {
        return gson.toJson(map)
    }
}