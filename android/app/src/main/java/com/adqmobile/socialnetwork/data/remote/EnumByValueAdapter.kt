package com.adqmobile.socialnetwork.data.remote

import com.google.gson.*
import java.lang.reflect.Type

interface HasValue {
    val value: String
}

class EnumByValueAdapter<T> : JsonDeserializer<T>, JsonSerializer<T> where T : Enum<T>, T : HasValue {
    private var values: Map<String, T>? = null

    @Suppress("UNCHECKED_CAST")
    override fun deserialize(json: JsonElement, type: Type, context: JsonDeserializationContext): T? {
        return (values ?: (type as Class<T>).enumConstants.associateBy {
            it.value
        }.also {
            values = it
        })[json.asString]
    }

    override fun serialize(src: T, type: Type, context: JsonSerializationContext): JsonElement {
        return JsonPrimitive(src.value)
    }
}