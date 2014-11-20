/**
 * Created with IntelliJ IDEA.
 * User: shin
 * Date: 14/11/19
 * Time: 23:46
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class Vacuum extends Sprite{
    public static const RADIUS:Number = 100;
    public function Vacuum() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE,init)
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE,init);
        //
        layout();

    }

    private function layout():void {
        var g:Graphics;
        g = this.graphics
        g.beginFill(0xFF0000,0.3);
        g.drawCircle(0,0,RADIUS);
        var sprite:Sprite = new Sprite();
        addChild(sprite);
        g = sprite.graphics;
        g.beginFill(0xFF0000)
        g.drawCircle(0,0,10);

        sprite.addEventListener(MouseEvent.MOUSE_DOWN , mouseDownHandler)

    }

    private function mouseDownHandler(event:MouseEvent):void {
        this.startDrag();

        stage.addEventListener(MouseEvent.MOUSE_UP , mouseUpHandler)
    }

    private function mouseUpHandler(event:MouseEvent):void {
        this.stopDrag();

        stage.removeEventListener(MouseEvent.MOUSE_UP , mouseUpHandler)
    }
}
}
