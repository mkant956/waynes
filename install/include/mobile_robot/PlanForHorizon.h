// Generated by gencpp from file mobile_robot/PlanForHorizon.msg
// DO NOT EDIT!


#ifndef MOBILE_ROBOT_MESSAGE_PLANFORHORIZON_H
#define MOBILE_ROBOT_MESSAGE_PLANFORHORIZON_H

#include <ros/service_traits.h>


#include <mobile_robot/PlanForHorizonRequest.h>
#include <mobile_robot/PlanForHorizonResponse.h>


namespace mobile_robot
{

struct PlanForHorizon
{

typedef PlanForHorizonRequest Request;
typedef PlanForHorizonResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PlanForHorizon
} // namespace mobile_robot


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mobile_robot::PlanForHorizon > {
  static const char* value()
  {
    return "6087eeac782002dae0e0d755723c10aa";
  }

  static const char* value(const ::mobile_robot::PlanForHorizon&) { return value(); }
};

template<>
struct DataType< ::mobile_robot::PlanForHorizon > {
  static const char* value()
  {
    return "mobile_robot/PlanForHorizon";
  }

  static const char* value(const ::mobile_robot::PlanForHorizon&) { return value(); }
};


// service_traits::MD5Sum< ::mobile_robot::PlanForHorizonRequest> should match 
// service_traits::MD5Sum< ::mobile_robot::PlanForHorizon > 
template<>
struct MD5Sum< ::mobile_robot::PlanForHorizonRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mobile_robot::PlanForHorizon >::value();
  }
  static const char* value(const ::mobile_robot::PlanForHorizonRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mobile_robot::PlanForHorizonRequest> should match 
// service_traits::DataType< ::mobile_robot::PlanForHorizon > 
template<>
struct DataType< ::mobile_robot::PlanForHorizonRequest>
{
  static const char* value()
  {
    return DataType< ::mobile_robot::PlanForHorizon >::value();
  }
  static const char* value(const ::mobile_robot::PlanForHorizonRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mobile_robot::PlanForHorizonResponse> should match 
// service_traits::MD5Sum< ::mobile_robot::PlanForHorizon > 
template<>
struct MD5Sum< ::mobile_robot::PlanForHorizonResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mobile_robot::PlanForHorizon >::value();
  }
  static const char* value(const ::mobile_robot::PlanForHorizonResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mobile_robot::PlanForHorizonResponse> should match 
// service_traits::DataType< ::mobile_robot::PlanForHorizon > 
template<>
struct DataType< ::mobile_robot::PlanForHorizonResponse>
{
  static const char* value()
  {
    return DataType< ::mobile_robot::PlanForHorizon >::value();
  }
  static const char* value(const ::mobile_robot::PlanForHorizonResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOBILE_ROBOT_MESSAGE_PLANFORHORIZON_H
