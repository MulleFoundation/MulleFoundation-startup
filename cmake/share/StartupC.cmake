if( NOT __STARTUP_C_CMAKE__)
   set( __STARTUP_C_CMAKE__ ON)

# can be included multiple times

   if( MULLE_TRACE_INCLUDE)
      message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
   endif()


   #
   # For mulle-objc, the startup library contains
   # ___get_or_create_mulle_objc_universe and
   # the startup code to create the universe.
   # For C it's rarely if ever needed
   #
   if( STARTUP_LIBRARY_NAME)
      if( NOT STARTUP_LIBRARY)
         find_library( STARTUP_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}${STARTUP_LIBRARY_NAME}${CMAKE_STATIC_LIBRARY_SUFFIX}
                                          ${STARTUP_LIBRARY_NAME})
      endif()
      if( NOT STARTUP_LIBRARY)
         message( FATAL_ERROR "Startup library \"${STARTUP_LIBRARY_NAME}\" not found")
      endif()
   endif()

   message( STATUS "STARTUP_LIBRARY_NAME is ${STARTUP_LIBRARY_NAME}")
   message( STATUS "STARTUP_LIBRARY is ${STARTUP_LIBRARY}")

   include( StartupAuxC OPTIONAL)

endif()
