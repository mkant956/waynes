// Auto-generated. Do not edit!

// (in-package mobile_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ShareLocalInformationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_id = null;
      this.horizon = null;
      this.x = null;
      this.y = null;
      this.theta = null;
      this.workspace = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_id')) {
        this.robot_id = initObj.robot_id
      }
      else {
        this.robot_id = 0;
      }
      if (initObj.hasOwnProperty('horizon')) {
        this.horizon = initObj.horizon
      }
      else {
        this.horizon = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
      if (initObj.hasOwnProperty('workspace')) {
        this.workspace = initObj.workspace
      }
      else {
        this.workspace = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ShareLocalInformationRequest
    // Serialize message field [robot_id]
    bufferOffset = _serializer.int16(obj.robot_id, buffer, bufferOffset);
    // Serialize message field [horizon]
    bufferOffset = _serializer.int16(obj.horizon, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float32(obj.theta, buffer, bufferOffset);
    // Serialize message field [workspace]
    bufferOffset = _arraySerializer.float32(obj.workspace, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ShareLocalInformationRequest
    let len;
    let data = new ShareLocalInformationRequest(null);
    // Deserialize message field [robot_id]
    data.robot_id = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [horizon]
    data.horizon = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [workspace]
    data.workspace = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.workspace.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mobile_robot/ShareLocalInformationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72fbadfc199772ffb3ff7f2d27d7a717';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 robot_id
    int16 horizon
    float32 x
    float32 y
    float32 theta
    float32[] workspace
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ShareLocalInformationRequest(null);
    if (msg.robot_id !== undefined) {
      resolved.robot_id = msg.robot_id;
    }
    else {
      resolved.robot_id = 0
    }

    if (msg.horizon !== undefined) {
      resolved.horizon = msg.horizon;
    }
    else {
      resolved.horizon = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    if (msg.workspace !== undefined) {
      resolved.workspace = msg.workspace;
    }
    else {
      resolved.workspace = []
    }

    return resolved;
    }
};

class ShareLocalInformationResponse {
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
    // Serializes a message object of type ShareLocalInformationResponse
    // Serialize message field [next_horizon]
    bufferOffset = _serializer.int16(obj.next_horizon, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ShareLocalInformationResponse
    let len;
    let data = new ShareLocalInformationResponse(null);
    // Deserialize message field [next_horizon]
    data.next_horizon = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mobile_robot/ShareLocalInformationResponse';
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
    const resolved = new ShareLocalInformationResponse(null);
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
  Request: ShareLocalInformationRequest,
  Response: ShareLocalInformationResponse,
  md5sum() { return '1ee98618110ac3e0511341f8c0d6d3a0'; },
  datatype() { return 'mobile_robot/ShareLocalInformation'; }
};
