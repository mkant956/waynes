// Generated by gencpp from file mobile_robot/PlanForHorizonResponse.msg
// DO NOT EDIT!


#ifndef MOBILE_ROBOT_MESSAGE_PLANFORHORIZONRESPONSE_H
#define MOBILE_ROBOT_MESSAGE_PLANFORHORIZONRESPONSE_H


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
struct PlanForHorizonResponse_
{
  typedef PlanForHorizonResponse_<ContainerAllocator> Type;

  PlanForHorizonResponse_()
    : next_horizon(0)  {
    }
  PlanForHorizonResponse_(const ContainerAllocator& _alloc)
    : next_horizon(0)  {
  (void)_alloc;
    }



   typedef int16_t _next_horizon_type;
  _next_horizon_type next_horizon;




  typedef boost::shared_ptr< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> const> ConstPtr;

}; // struct PlanForHorizonResponse_

typedef ::mobile_robot::PlanForHorizonResponse_<std::allocator<void> > PlanForHorizonResponse;

typedef boost::shared_ptr< ::mobile_robot::PlanForHorizonResponse > PlanForHorizonResponsePtr;
typedef boost::shared_ptr< ::mobile_robot::PlanForHorizonResponse const> PlanForHorizonResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "04c324cba8007ef9d719444128ac85c2";
  }

  static const char* value(const ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x04c324cba8007ef9ULL;
  static const uint64_t static_value2 = 0xd719444128ac85c2ULL;
};

template<class ContainerAllocator>
struct DataType< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mobile_robot/PlanForHorizonResponse";
  }

  static const char* value(const ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 next_horizon\n\
\n\
";
  }

  static const char* value(const ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.next_horizon);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PlanForHorizonResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mobile_robot::PlanForHorizonResponse_<ContainerAllocator>& v)
  {
    s << indent << "next_horizon: ";
    Printer<int16_t>::stream(s, indent + "  ", v.next_horizon);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOBILE_ROBOT_MESSAGE_PLANFORHORIZONRESPONSE_H
