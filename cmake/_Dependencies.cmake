# cmake/_Dependencies.cmake is generated by `mulle-sde`. Edits will be lost.
#
if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

if( NOT MULLE_OBJC_OSFOUNDATION_LIBRARY)
   find_library( MULLE_OBJC_OSFOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}MulleObjCOSFoundation${CMAKE_STATIC_LIBRARY_SUFFIX} MulleObjCOSFoundation)
   message( STATUS "MULLE_OBJC_OSFOUNDATION_LIBRARY is ${MULLE_OBJC_OSFOUNDATION_LIBRARY}")

   # the order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need
   if( MULLE_OBJC_OSFOUNDATION_LIBRARY)
      set( ALL_LOAD_DEPENDENCY_LIBRARIES
         ${ALL_LOAD_DEPENDENCY_LIBRARIES}
         ${MULLE_OBJC_OSFOUNDATION_LIBRARY}
         CACHE INTERNAL "need to cache this"
      )
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE_OBJC_OSFOUNDATION_ROOT "${MULLE_OBJC_OSFOUNDATION_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE_OBJC_OSFOUNDATION_ROOT "${_TMP_MULLE_OBJC_OSFOUNDATION_ROOT}" DIRECTORY)

      # search for DependenciesAndLibraries.cmake to include
      foreach( _TMP_MULLE_OBJC_OSFOUNDATION_NAME in MulleObjCOSFoundation)
         set( _TMP_MULLE_OBJC_OSFOUNDATION_DIR "${_TMP_MULLE_OBJC_OSFOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_OSFOUNDATION_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( EXISTS "${_TMP_MULLE_OBJC_OSFOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            unset( MULLE_OBJC_OSFOUNDATION_DEFINITIONS)
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE_OBJC_OSFOUNDATION_DIR}")
            include( "${_TMP_MULLE_OBJC_OSFOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE_OBJC_OSFOUNDATION_DIR}")
            set( INHERITED_DEFINITIONS
               ${INHERITED_DEFINITIONS}
               ${MULLE_OBJC_OSFOUNDATION_DEFINITIONS}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()

      # search for objc-loader.inc in include directory
      foreach( _TMP_MULLE_OBJC_OSFOUNDATION_NAME in MulleObjCOSFoundation)
         set( _TMP_MULLE_OBJC_OSFOUNDATION_FILE "${_TMP_MULLE_OBJC_OSFOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_OSFOUNDATION_NAME}/objc-loader.inc")
         if( EXISTS "${_TMP_MULLE_OBJC_OSFOUNDATION_FILE}")
            set( INHERITED_OBJC_LOADERS
               ${INHERITED_OBJC_LOADERS}
               ${_TMP_MULLE_OBJC_OSFOUNDATION_FILE}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()
   else()
      message( FATAL_ERROR "MULLE_OBJC_OSFOUNDATION_LIBRARY was not found")
   endif()
endif()


if( NOT MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY)
   find_library( MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}MulleObjCExpatFoundation${CMAKE_STATIC_LIBRARY_SUFFIX} MulleObjCExpatFoundation)
   message( STATUS "MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY is ${MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY}")

   # the order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need
   if( MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY)
      set( ALL_LOAD_DEPENDENCY_LIBRARIES
         ${ALL_LOAD_DEPENDENCY_LIBRARIES}
         ${MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY}
         CACHE INTERNAL "need to cache this"
      )
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_ROOT "${MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_ROOT "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_ROOT}" DIRECTORY)

      # search for DependenciesAndLibraries.cmake to include
      foreach( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_NAME in MulleObjCExpatFoundation)
         set( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_DIR "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( EXISTS "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            unset( MULLE_OBJC_EXPAT_FOUNDATION_DEFINITIONS)
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_DIR}")
            include( "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_DIR}")
            set( INHERITED_DEFINITIONS
               ${INHERITED_DEFINITIONS}
               ${MULLE_OBJC_EXPAT_FOUNDATION_DEFINITIONS}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()

      # search for objc-loader.inc in include directory
      foreach( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_NAME in MulleObjCExpatFoundation)
         set( _TMP_MULLE_OBJC_EXPAT_FOUNDATION_FILE "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_NAME}/objc-loader.inc")
         if( EXISTS "${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_FILE}")
            set( INHERITED_OBJC_LOADERS
               ${INHERITED_OBJC_LOADERS}
               ${_TMP_MULLE_OBJC_EXPAT_FOUNDATION_FILE}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()
   else()
      message( STATUS "MULLE_OBJC_EXPAT_FOUNDATION_LIBRARY is missing but it is marked as \"no-require\"")
   endif()
endif()


if( NOT MULLE_OBJC_KVCFOUNDATION_LIBRARY)
   find_library( MULLE_OBJC_KVCFOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}MulleObjCKVCFoundation${CMAKE_STATIC_LIBRARY_SUFFIX} MulleObjCKVCFoundation)
   message( STATUS "MULLE_OBJC_KVCFOUNDATION_LIBRARY is ${MULLE_OBJC_KVCFOUNDATION_LIBRARY}")

   # the order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need
   if( MULLE_OBJC_KVCFOUNDATION_LIBRARY)
      set( ALL_LOAD_DEPENDENCY_LIBRARIES
         ${ALL_LOAD_DEPENDENCY_LIBRARIES}
         ${MULLE_OBJC_KVCFOUNDATION_LIBRARY}
         CACHE INTERNAL "need to cache this"
      )
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE_OBJC_KVCFOUNDATION_ROOT "${MULLE_OBJC_KVCFOUNDATION_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE_OBJC_KVCFOUNDATION_ROOT "${_TMP_MULLE_OBJC_KVCFOUNDATION_ROOT}" DIRECTORY)

      # search for DependenciesAndLibraries.cmake to include
      foreach( _TMP_MULLE_OBJC_KVCFOUNDATION_NAME in MulleObjCKVCFoundation)
         set( _TMP_MULLE_OBJC_KVCFOUNDATION_DIR "${_TMP_MULLE_OBJC_KVCFOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_KVCFOUNDATION_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( EXISTS "${_TMP_MULLE_OBJC_KVCFOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            unset( MULLE_OBJC_KVCFOUNDATION_DEFINITIONS)
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE_OBJC_KVCFOUNDATION_DIR}")
            include( "${_TMP_MULLE_OBJC_KVCFOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE_OBJC_KVCFOUNDATION_DIR}")
            set( INHERITED_DEFINITIONS
               ${INHERITED_DEFINITIONS}
               ${MULLE_OBJC_KVCFOUNDATION_DEFINITIONS}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()

      # search for objc-loader.inc in include directory
      foreach( _TMP_MULLE_OBJC_KVCFOUNDATION_NAME in MulleObjCKVCFoundation)
         set( _TMP_MULLE_OBJC_KVCFOUNDATION_FILE "${_TMP_MULLE_OBJC_KVCFOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_KVCFOUNDATION_NAME}/objc-loader.inc")
         if( EXISTS "${_TMP_MULLE_OBJC_KVCFOUNDATION_FILE}")
            set( INHERITED_OBJC_LOADERS
               ${INHERITED_OBJC_LOADERS}
               ${_TMP_MULLE_OBJC_KVCFOUNDATION_FILE}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()
   else()
      message( FATAL_ERROR "MULLE_OBJC_KVCFOUNDATION_LIBRARY was not found")
   endif()
endif()


if( NOT MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY)
   find_library( MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}MulleObjCDecimalFoundation${CMAKE_STATIC_LIBRARY_SUFFIX} MulleObjCDecimalFoundation)
   message( STATUS "MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY is ${MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY}")

   # the order looks ascending, but due to the way this file is read
   # it ends up being descending, which is what we need
   if( MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY)
      set( DEPENDENCY_LIBRARIES
         ${DEPENDENCY_LIBRARIES}
         ${MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY}
         CACHE INTERNAL "need to cache this"
      )
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( _TMP_MULLE_OBJC_DECIMAL_FOUNDATION_ROOT "${MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY}" DIRECTORY)
      get_filename_component( _TMP_MULLE_OBJC_DECIMAL_FOUNDATION_ROOT "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_ROOT}" DIRECTORY)

      # search for DependenciesAndLibraries.cmake to include
      foreach( _TMP_MULLE_OBJC_DECIMAL_FOUNDATION_NAME in MulleObjCDecimalFoundation)
         set( _TMP_MULLE_OBJC_DECIMAL_FOUNDATION_DIR "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_ROOT}/include/${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_NAME}/cmake")
         # use explicit path to avoid "surprises"
         if( EXISTS "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            unset( MULLE_OBJC_DECIMAL_FOUNDATION_DEFINITIONS)
            list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_DIR}")
            include( "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
            list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_MULLE_OBJC_DECIMAL_FOUNDATION_DIR}")
            set( INHERITED_DEFINITIONS
               ${INHERITED_DEFINITIONS}
               ${MULLE_OBJC_DECIMAL_FOUNDATION_DEFINITIONS}
               CACHE INTERNAL "need to cache this"
            )
            break()
         endif()
      endforeach()
   else()
      message( STATUS "MULLE_OBJC_DECIMAL_FOUNDATION_LIBRARY is missing but it is marked as \"no-require\"")
   endif()
endif()
