//
//  Special_CAEAGLLayer.swift
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

class Special_CAEAGLLayer:GLKViewController {
    fileprivate lazy var glView:GLKView = {
        [weak self] in
        var aView = GLKView(frame:(self?.view.bounds)!)
        aView.isUserInteractionEnabled = false
        aView.isMultipleTouchEnabled = false
        aView.layer.backgroundColor = UIColor.clear.cgColor
        return aView
        }()
    
    var glContext:EAGLContext!
    var glLayer:CAEAGLLayer!
    var framebuffer:GLuint = GLuint()
    var colorRenderbuffer:GLuint = GLuint()
    var framebufferWidth:GLint = GLint()
    var framebufferHeight:GLint = GLint()
    var effect:GLKBaseEffect!
    
    func setUpBuffers(){
        glGenFramebuffers(1,&framebuffer)
        glBindFramebuffer(GLenum(GL_FRAMEBUFFER), framebuffer)
        
        glGenRenderbuffers(1, &colorRenderbuffer)
        glBindFramebuffer(GLenum(GL_RENDERBUFFER), colorRenderbuffer)
        glFramebufferRenderbuffer(GLenum(GL_FRAMEBUFFER), GLenum(GL_COLOR_ATTACHMENT0), GLenum(GL_RENDERBUFFER), colorRenderbuffer)
        glContext.renderbufferStorage(Int(GL_RENDERBUFFER), from: glLayer)
        glGetRenderbufferParameteriv(GLenum(GL_RENDERBUFFER), GLenum(GL_RENDERBUFFER_WIDTH), &framebufferWidth)
        glGetRenderbufferParameteriv(GLenum(GL_RENDERBUFFER), GLenum(GL_RENDERBUFFER_HEIGHT), &framebufferHeight)
        
        if (glCheckFramebufferStatus(GLenum(GL_FRAMEBUFFER)) != GL_FRAMEBUFFER_COMPLETE) {
            print("Failed to make complete framebuffer object: %i", glCheckFramebufferStatus(GLenum(GL_FRAMEBUFFER)))
        }
        
    }
    
    func tearDownBuffers(){
        glDeleteFramebuffers(1, &framebuffer)
        framebuffer = 0
        
        glDeleteFramebuffers(1, &colorRenderbuffer)
        colorRenderbuffer = 0
    }
    
    func drawFrame() {
        glBindFramebuffer(GLenum(GL_RENDERBUFFER), framebuffer)
        glViewport(0, 0, framebufferWidth, framebufferHeight)
        
        effect.prepareToDraw()
        
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        glClearColor(0.0, 0.0, 0.0, 1.0)
        
        let vertices:[GLfloat] = [-0.5, -0.5, -1.0, 0.0, 0.5, -1.0, 0.5, -0.5, -1.0]
        let colors:[GLfloat] = [0.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0]
        
        glEnableVertexAttribArray(GLuint(GLKVertexAttrib.position.rawValue))
        glEnableVertexAttribArray(GLuint(GLKVertexAttrib.color.rawValue))
        glVertexAttribPointer(GLuint(GLKVertexAttrib.position.rawValue), 3, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 0, vertices)
        glVertexAttribPointer(GLuint(GLKVertexAttrib.color.rawValue), 4, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 0, colors)
        glDrawArrays(GLenum(GL_TRIANGLES), 0, 3)
        
        glBindRenderbuffer(GLenum(GL_RENDERBUFFER), colorRenderbuffer)
        glContext.presentRenderbuffer(Int(GL_RENDERBUFFER))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        view.addSubview(glView)
        glContext = EAGLContext.init(api: .openGLES2)
        EAGLContext.setCurrent(glContext)

        glLayer = CAEAGLLayer()
        glLayer.frame = glView.bounds
        glView.layer.addSublayer(glLayer)
        glLayer.drawableProperties = [kEAGLDrawablePropertyRetainedBacking:false,
        kEAGLDrawablePropertyColorFormat: kEAGLColorFormatRGBA8]

        effect = GLKBaseEffect()
        setUpBuffers()
        drawFrame()
//        let glView2 = MyGlView(frame: CGRect(x:(self.view.bounds.width-200)/2.0, y:200, width:200, height:250), context: EAGLContext(api: .openGLES2)!)
//        glView2.backgroundColor = UIColor.clear
        
    }
    
    deinit {
        tearDownBuffers()
        EAGLContext.setCurrent(nil)
    }
}
