// Auto-generated. Do not edit!

// (in-package mobile_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlanInstance = require('../msg/PlanInstance.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PlanForHorizonRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.total_robots = null;
      this.horizon_length = null;
      this.plans = null;
    }
    else {
      if (initObj.hasOwnProperty('total_robots')) {
        this.total_robots = initObj.total_robots
      }
      else {
        this.total_robots = 0;
      }
      if (initObj.hasOwnProperty('horizon_length')) {
        this.horizon_length = initObj.horizon_length
      }
      else {
        this.horizon_length = 0;
      }
      if (initObj.hasOwnProperty('plans')) {
        this.plans = initObj.plans
      }
      else {
        this.plans = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanForHorizonRequest
    // Serialize message field [total_robots]
    bufferOffset = _serializer.int16(obj.total_robots, buffer, bufferOffset);
    // Serialize message field [horizon_length]
    bufferOffset = _serializer.int16(obj.horizon_length, buffer, bufferOffset);
    // Serialize message field [plans]
    // Serialize the length for message field [plans]
    bufferOffset = _serializer.uint32(obj.plans.length, buffer, bufferOffset);
    obj.plans.forEach((val) => {
      bufferOffset = PlanInstance.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanForHorizonRequest
    let len;
    let data = new PlanForHorizonRequest(null);
    // Deserialize message field [total_robots]
    data.total_robots = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [horizon_length]
    data.horizon_length = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [plans]
    // Deserialize array length for message field [plans]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.plans = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.plans[i] = PlanInstance.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.plans.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mobile_robot/PlanForHorizonRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '110487f1256d199309e59bf3a67dfecb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 total_robots
    int16 horizon_length
    PlanInstance[] plans
    
    ================================================================================
    MSG: mobile_robot/PlanInstance
    int16 robot_id
    int16 horizon_step
    float32 x
    float32 y
    float32 theta
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanForHorizonRequest(null);
    if (msg.total_robots !== undefined) {
      resolved.total_robots = msg.total_robots;
    }
    else {
      resolved.total_robots = 0
    }

    if (msg.horizon_length !== undefined) {
      resolved.horizon_length = msg.horizon_length;
    }
    else {
      resolved.horizon_length = 0
    }

    if (msg.plans !== undefined) {
      resolved.plans = new Array(msg.plans.length);
      for (let i = 0; i < resolved.plans.length; ++i) {
        resolved.plans[i] = PlanInstance.Resolve(msg.plans[i]);
      }
    }
    else {
      resolved.plans = []
    }

    return resolved;
    }
};

class PlanForHorizonResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.next_horizon = null;
    }
    else {
      if (initObj.hasOwnProperty('next_horizon')) {
        this.next_horizon = initObj.next_horizon
      }
      else {
        this.next_horizon = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanForHorizonResponse
    // Serialize message field [next_horizon]
    bufferOffset = _serializer.int16(obj.next_horizon, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanForHorizonResponse
    let len;
    let data = new PlanForHorizonResponse(null);
    // Deserialize message field [next_horizon]
    data.next_horizon = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mobile_robot/PlanForHorizonResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '04c324cba8007ef9d719444128ac85c2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 next_horizon
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanForHorizonResponse(null);
    if (msg.next_horizon !== undefined) {
      resolved.next_horizon = msg.next_horizon;
    }
    else {
      resolved.next_horizon = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: PlanForHorizonRequest,
  Response: PlanForHorizonResponse,
  md5sum() { return '6087eeac782002dae0e0d755723c10aa'; },
  datatype() { return 'mobile_robot/PlanForHorizon'; }
};
