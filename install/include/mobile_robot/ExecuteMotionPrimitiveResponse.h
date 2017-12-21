// Generated by gencpp from file mobile_robot/ExecuteMotionPrimitiveResponse.msg
// DO NOT EDIT!


#ifndef MOBILE_ROBOT_MESSAGE_EXECUTEMOTIONPRIMITIVERESPONSE_H
#define MOBILE_ROBOT_MESSAGE_EXECUTEMOTIONPRIMITIVERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mobile_robot
{
template <class ContainerAllocator>
struct ExecuteMotionPrimitiveResponse_
{
  typedef ExecuteMotionPrimitiveResponse_<ContainerAllocator> Type;

  ExecuteMotionPrimitiveResponse_()
    : done(0)  {
    }
  ExecuteMotionPrimitiveResponse_(const ContainerAllocator& _alloc)
    : done(0)  {
  (void)_alloc;
    }



   typedef int64_t _done_type;
  _done_type done;




  typedef boost::shared_ptr< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ExecuteMotionPrimitiveResponse_

typedef ::mobile_robot::ExecuteMotionPrimitiveResponse_<std::allocator<void> > ExecuteMotionPrimitiveResponse;

typedef boost::shared_ptr< ::mobile_robot::ExecuteMotionPrimitiveResponse > ExecuteMotionPrimitiveResponsePtr;
typedef boost::shared_ptr< ::mobile_robot::ExecuteMotionPrimitiveResponse const> ExecuteMotionPrimitiveResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mobile_robot

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'mobile_robot': ['/home/pi/catkin_ws/src/mobile_robot/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "451104427704de2eb28d1a5e0b6e1832";
  }

  static const char* value(const ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x451104427704de2eULL;
  static const uint64_t static_value2 = 0xb28d1a5e0b6e1832ULL;
};

template<class ContainerAllocator>
struct DataType< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mobile_robot/ExecuteMotionPrimitiveResponse";
  }

  static const char* value(const ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 done\n\
\n\
";
  }

  static const char* value(const ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.done);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ExecuteMotionPrimitiveResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mobile_robot::ExecuteMotionPrimitiveResponse_<ContainerAllocator>& v)
  {
    s << indent << "done: ";
    Printer<int64_t>::stream(s, indent + "  ", v.done);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOBILE_ROBOT_MESSAGE_EXECUTEMOTIONPRIMITIVERESPONSE_H