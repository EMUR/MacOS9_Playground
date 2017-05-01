import UIKit
import PlaygroundSupport


var container:UIView!
var lastClicked = -1;
var menubar:UIView!
var aboutHidden = true
var about:UIImageView!
var wallpaper:UIImageView!
var selectedWallpaper = 1

class Responder : NSObject {
    func action(sender:UIButton!) {
        
        if(lastClicked != -1)
        {
            for i in menubar.subviews
            {
                if let btn = i as? UIButton {
                    
                   btn.backgroundColor = UIColor.clear
                    btn.setTitleColor(UIColor.black, for: .normal)
                }
            }
            
            if( lastClicked != 2)
            {
            container.subviews[container.subviews.count-1].removeFromSuperview()
            }else
            {
                container.viewWithTag(100)?.removeFromSuperview()
            }
            
            if(lastClicked == sender.tag)
            {
                lastClicked = -1;
                return
            }
            
            lastClicked = -1;
        }
        
        switch sender.tag {
        case 0:
            
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.white, for: .normal)
            
            let SubMenuItems = [ " Name: Eyad Murshid "," School: UC Santa Cruz ", " WebPage: www.emur.io "]
            
            var shifter:CGFloat = 0.0

              let v =  UIView(frame: CGRect(x: sender.bounds.maxX, y: sender.bounds.maxY, width: container.bounds.width/2, height:CGFloat(SubMenuItems.count * 25)))
            
            v.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            

            
            for i in SubMenuItems
            {
                let name = UILabel(frame: CGRect(x: 5, y: 5 + shifter, width: v.bounds.width, height: 20))
                
                name.font = UIFont(name: "courier-Bold", size: 14)
                
                name.text = i
                
                v.addSubview(name)
                
                shifter += name.bounds.height
                
            }
            
            container.insertSubview(v, at: container.subviews.count)


            lastClicked = 0
            break
            
        case 1:
            
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.white, for: .normal)
            
            
            let PtojectsSubMenuItems = [ " Mathability "," KOOB ", " Many more.. "]
            var SubDescItems = [ "Swift-paced mathematics game with lots of fun and diverse problems. Available in App Store ","Book exchange app that aims to simplify the processes of buying/selling textbooks for college students ", "Many more projects at github.com/emur"]

            
            var shifter:CGFloat = 0.0
            
            let v =  UIView(frame: CGRect(x: sender.bounds.maxX, y: sender.bounds.maxY, width: container.bounds.width/1.6, height:CGFloat(PtojectsSubMenuItems.count * 60)))
            
            
            v.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            
            var counterIndex = 0;
            
            for i in PtojectsSubMenuItems
            {
                let name = UILabel(frame: CGRect(x: 5, y: 5 + shifter, width: v.bounds.width, height: 20))
                
                name.font = UIFont(name: "courier-Bold", size: 14)
                
                name.text = i
                
                shifter += name.bounds.height

                v.addSubview(name)
                
                let descript = UILabel(frame: CGRect(x: 15, y: 5 + shifter, width: v.bounds.width, height: 20))
                
                
                descript.numberOfLines = 0
                
                descript.baselineAdjustment = UIBaselineAdjustment.alignBaselines
                
                descript.font = UIFont(name: "courier", size: 11)
                
                descript.text = SubDescItems[counterIndex]
                
                descript.sizeToFit()
                
                descript.lineBreakMode = NSLineBreakMode.byWordWrapping

                v.addSubview(descript)
                
                counterIndex+=1
                
                shifter += descript.bounds.height * 1.3

            }
            
            container.insertSubview(v, at: container.subviews.count)
            
            
            lastClicked = 1
            break;
            
            
        case 2:
            
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.white, for: .normal)
            
            let SubMenuItems = [ " Default "," Sierra ( Future ) "]
            
            var shifter:CGFloat = 0.0
            
        
            let v =  UIView(frame: CGRect(x: sender.bounds.maxX, y: sender.bounds.maxY, width: container.bounds.width/2, height:CGFloat(SubMenuItems.count * 25)))
            
            v.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            
            v.tag = 100
            
            
            
            for i in 1...SubMenuItems.count
            {
                let name = UILabel(frame: CGRect(x: 5, y: 5 + shifter, width: v.bounds.width, height: 20))
                let bts = UIButton(frame: name.bounds)
                
                bts.addTarget(self, action: #selector(changeWallpaper), for: .touchUpInside)
                
                bts.tag = i
                
                if ( i == selectedWallpaper)
                {
                        name.textColor = UIColor.white
                    name.backgroundColor = UIColor.black
                }
                else
                {
                    name.textColor = UIColor.black
                    name.backgroundColor = UIColor.clear
                }
                
                bts.setTitle("", for: .normal)
                
                name.addSubview(bts)
                
                name.isUserInteractionEnabled = true

                name.font = UIFont(name: "courier-Bold", size: 14)
                
                name.text = SubMenuItems[i-1]
                
                v.addSubview(name)
                
                shifter += name.bounds.height
                
            }
            
            container.insertSubview(v, at: container.subviews.count)
            
            
            lastClicked = 2

            break
            
            
        default:
            
            break
            
        }
        
    }
    
    func updateTime(_ menuitem1: Timer)
    {
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        if let userInfo = menuitem1.userInfo as? UIButton {

            if ( minutes < 9)
            {
            userInfo.setTitle("\(hour):0\(minutes)", for: UIControlState.normal)
            }else
            {
                userInfo.setTitle("\(hour):\(minutes)", for: UIControlState.normal)

            }
        }
        
        
    }
    
    func changeWallpaper(sender:UIButton!)
    {
        selectedWallpaper = sender.tag
        wallpaper.image = UIImage(named: "wall\(sender.tag).jpg")
        container.viewWithTag(100)?.removeFromSuperview()
    }
    
    func clickedAppleLogo()
    {
     
        if(aboutHidden)
        {
            about.isHidden = false
            aboutHidden = false
        }
        else
        {
            about.isHidden = true
            aboutHidden = true
        }
    }
}

let responder = Responder()

var MenuItems = [" About "," Projects ", " Wallpaper "]

container = UIView(frame: CGRect(x: 0, y: 0, width: 548.571428571429, height: 548.571428571429))
container.backgroundColor = UIColor.white

let containerWidth = container.bounds.width
let menuBarHeight = container.bounds.width * 0.05


wallpaper = UIImageView(frame: container.frame)
wallpaper.image = UIImage(named: "wall1.jpg")
wallpaper.contentMode = UIViewContentMode.scaleAspectFill
container.addSubview(wallpaper)

menubar = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: menuBarHeight))
menubar.backgroundColor = UIColor(white: 1.0, alpha: 0.8)

menubar.layer.shadowColor = UIColor.black.cgColor
menubar.layer.shadowOpacity = 0.6
menubar.layer.shadowOffset = CGSize.zero
menubar.layer.shadowRadius = 10

about = UIImageView(image: UIImage(named: "about"))
about.center = container.center
about.isUserInteractionEnabled = true
about.isHidden = true

let close = UIButton(frame: CGRect(x: about.bounds.minX, y: about.bounds.minY, width: 20, height: 20))

close.addTarget(responder, action: #selector(Responder.clickedAppleLogo), for: .touchUpInside)

about.addSubview(close)

about.layer.shadowColor = UIColor.black.cgColor
about.layer.shadowOpacity = 0.6
about.layer.shadowOffset = CGSize.zero
about.layer.shadowRadius = 10

container.addSubview(about)

var appleLogo = UIImageView(frame: CGRect(x: 10, y: menubar.center.y - 10, width: menubar.bounds.height/1, height: menubar.bounds.height/1.3))

appleLogo.image = UIImage(named: "apple")

menubar.addSubview(appleLogo)

let bt = UIButton(frame: appleLogo.frame)
bt.titleLabel?.text = ""

bt.addTarget(responder, action: #selector(Responder.clickedAppleLogo), for: .touchUpInside)


menubar.addSubview(bt)

var shift:CGFloat = 0.0
var count = 0
let clockTimer:Timer

for i in MenuItems
{
    let menuitem1 = UIButton(frame: CGRect(x: CGFloat(40 + shift), y: menuBarHeight/10, width: CGFloat(100), height: CGFloat(100)))
    
    menuitem1.setTitle(i, for: UIControlState.normal)
    
    menuitem1.setTitleColor(UIColor.black, for: UIControlState.normal)
    
    menuitem1.titleLabel?.font = UIFont(name: "courier-Bold", size: 14)
    
    menuitem1.sizeToFit()
    
    menuitem1.addTarget(responder, action: #selector(Responder.action), for: .touchUpInside)
    
    menuitem1.tag = count

    
    menubar.addSubview(menuitem1)
    
    shift += menuitem1.bounds.width
    
    count+=1

}


let menuitem1 = UIButton(frame: CGRect(x: CGFloat(containerWidth-shift/1.5), y:-menuBarHeight-6, width: CGFloat(100), height: CGFloat(100)))

menuitem1.setTitleColor(UIColor.black, for: UIControlState.normal)

menuitem1.titleLabel?.font = UIFont(name: "courier-Bold", size: 14)


menubar.addSubview(menuitem1)

menubar.alpha = 0.9

clockTimer = Timer.scheduledTimer(timeInterval: 0.5, target: responder, selector: #selector(Responder.updateTime(_:)), userInfo: menuitem1, repeats: true)


let path = UIBezierPath(roundedRect:menubar.bounds,
                        byRoundingCorners:[.topRight, .topLeft],
                        cornerRadii: CGSize(width: 10, height:  10))

let maskLayer = CAShapeLayer()

maskLayer.path = path.cgPath
menubar.layer.mask = maskLayer



container.insertSubview(menubar, at: container.subviews.count)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = container
