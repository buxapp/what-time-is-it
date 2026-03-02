package com.getbux.assignment

import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.server.testing.*
import kotlin.test.*

class ApplicationTest {
    @Test
    fun testRoot() = testApplication {
        application {
            module()
        }
        client.get("/amsterdam").apply {
            assertEquals(HttpStatusCode.OK, status)
        }
    }
}
