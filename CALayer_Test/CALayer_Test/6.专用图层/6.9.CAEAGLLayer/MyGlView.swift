//
//  MyGlView.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/23.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit
import GLKit
import QuartzCore
import OpenGLES

public class MyGlView : GLKView{
    public override func draw(_ rect: CGRect) {
        //self.context.set
        
        let fragmentShader  =     "varying lowp vec4 vColor;\n"
            + "void main(void) {\n"
            +  "gl_FragColor = vColor;\n"
            + "}\n" as NSString
        
        let vertexShader = "attribute vec4 a_Color;\n attribute vec4 a_Position;\n varying lowp vec4 vColor; void main(void) {\n   gl_Position = a_Position;\n gl_Position.x = a_Position.x * 2.0;\n vColor = a_Color;\n}\n" as NSString
        
        enum VertexAttributes : GLuint {
            case vertexAttribPosition = 0
            case colorAttribPosition = 1
        }
        
        struct Vertex {
            var x : GLfloat = 0.0
            var y : GLfloat = 0.0
            var z : GLfloat = 0.0
            
            init(_ x : GLfloat, _ y : GLfloat, _ z : GLfloat) {
                self.x = x
                self.y = y
                self.z = z
            }
        }
        
        struct Color {
            var red : GLfloat = 0.0;
            var green : GLfloat = 0.0;
            var blue : GLfloat = 0.0;
            var alpha : GLfloat = 1.0;
            init(_ red : GLfloat, _ green : GLfloat, _ blue : GLfloat, _ alpha : GLfloat){
                self.red = red;
                self.green = green;
                self.blue = blue;
            }
        }
        
        let vertices : [Vertex] = [
            Vertex( 0.0,  0.86, 0.0),    // TOP
            Vertex(-0.5, -0.25, 0.0),    // LEFT
            Vertex( 0.5, -0.25, 0.0),    // RIGHT
        ]
        
        let colors : [Color] = [
            Color(1.0, 0.0, 0.0,0),
            Color(0.0, 1.0, 0.0,0),
            Color(0.0, 0.0, 1.0,0),
            ]
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT));
        glClear(GLbitfield(GL_DEPTH_BUFFER_BIT))
        glClearColor(1.0, 1.0, 1.0, 1)
        
        var programHandle : GLuint = 0
        func compileShader(source :NSString, type: GLenum) -> GLuint {
            let shaderHandle = glCreateShader(type)
            var vertexShaderString = source.utf8String
            var shaderStringLength : GLint = GLint(Int32(vertexShader.length))
            glShaderSource(shaderHandle, 1, &vertexShaderString, &shaderStringLength)
            glCompileShader(shaderHandle)
            
            var compileStatus : GLint = 0
            glGetShaderiv(shaderHandle, GLenum(GL_COMPILE_STATUS), &compileStatus)
            if compileStatus == GL_FALSE {
                print("xxxxxxxxxxx")
                var infoLength : GLsizei = 0
                let bufferLength : GLsizei = 1024
                glGetShaderiv(shaderHandle, GLenum(GL_INFO_LOG_LENGTH), &infoLength)
                
                let info : [GLchar] = Array(repeating: GLchar(0), count: Int(bufferLength))
                var actualLength : GLsizei = 0
                
                glGetShaderInfoLog(shaderHandle, bufferLength, &actualLength, UnsafeMutablePointer(mutating: info))
                if type == GLenum(GL_VERTEX_SHADER) {
                    NSLog("vertex shader error");
                }else if type == GLenum(GL_FRAGMENT_SHADER){
                    NSLog("framgent shader error")
                }
                NSLog(String(validatingUTF8: info)!)
                exit(1)
            }
            return shaderHandle
        }
        
        let vertexShaderHandle = compileShader(source: vertexShader, type: GLenum(GL_VERTEX_SHADER))
        let fragmentShaderHandle = compileShader(source:fragmentShader, type:GLenum(GL_FRAGMENT_SHADER))
        
        programHandle = glCreateProgram()
        glBindAttribLocation(programHandle, VertexAttributes.vertexAttribPosition.rawValue, "a_Position")
        glBindAttribLocation(programHandle, VertexAttributes.colorAttribPosition.rawValue, "a_Color")
        glAttachShader(programHandle, vertexShaderHandle)
        glAttachShader(programHandle, fragmentShaderHandle)
        
        
        glLinkProgram(programHandle)
        glUseProgram(programHandle)
        
        
        
        var vertexBuffer : GLuint = 0
        
        glGenBuffers(GLsizei(1), &vertexBuffer)
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vertexBuffer)
        let count = vertices.count
        let size =  MemoryLayout<Vertex>.size
        glBufferData(GLenum(GL_ARRAY_BUFFER), count * size, vertices, GLenum(GL_STATIC_DRAW))
        
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        glEnableClientState(GLenum(GL_COLOR_ARRAY));        glEnableVertexAttribArray(VertexAttributes.vertexAttribPosition.rawValue)
        glVertexAttribPointer(
            VertexAttributes.vertexAttribPosition.rawValue,
            3,
            GLenum(GL_FLOAT),
            GLboolean(GL_FALSE),
            GLsizei(MemoryLayout<Vertex>.size), nil)
        
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vertexBuffer)
        
        var colorBuffer : GLuint = 0;
        //glEnableClientState(GLenum(GL_))
        
        glGenBuffers(GLsizei(1), &colorBuffer)
        //glBindBuffer(GLenum(GL_ARRAY_BUFFER), colorBuffer)
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), colorBuffer)
        let color_count = vertices.count
        let color_size =  MemoryLayout<Color>.size
        print(" count \(color_count), size \(color_size)")
        glBufferData(GLenum(GL_ARRAY_BUFFER), color_count * color_size, colors, GLenum(GL_STATIC_DRAW))
        
        glEnableVertexAttribArray(VertexAttributes.colorAttribPosition.rawValue)
        glVertexAttribPointer(VertexAttributes.colorAttribPosition.rawValue,4,GLenum(GL_FLOAT), GLboolean(GL_FALSE), 0,nil)
        
        glDrawArrays(GLenum(GL_TRIANGLES), 0, 3)
        glScalef(0.1, 1.0, 1.0)//not provided since gl2.0
        glDisableVertexAttribArray(VertexAttributes.vertexAttribPosition.rawValue)
    }
}
