package {

import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class Main extends Sprite {
    private var dragCard:Sprite;
    private var vacuumList:Array;
    public function Main() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE,init);
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE,init);
        //
        layout();

    }

    private function layout():void {

        var i:uint;
        var n:uint;
        var g:Graphics;
        var vacuum:Vacuum;
        //

        //
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        vacuumList = [];
        n = 5;
        for(i=0;i<n;i++)
        {
            vacuum = new Vacuum();
            addChild(vacuum);
            vacuum.x = stage.stageWidth*Math.random();
            vacuum.y = stage.stageHeight*Math.random();
            vacuumList.push(vacuum);
        }

        var card:Sprite = new Sprite();
        addChild(card);
        g = card.graphics;
        g.beginFill(0x000000);
        g.drawCircle(0,0,30);
        card.x = stage.stageWidth * 0.5;
        card.y = stage.stageHeight * 0.5;
        card.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);

    }

    private function mouseDownHandler(event:MouseEvent):void {
        trace(mouseDownHandler)
        var g:Graphics;
        dragCard = new Sprite();
        addChild(dragCard);
		g = dragCard.graphics;
        g.beginFill(0x000000);
        g.drawCircle(0,0,30);
        dragCard.x = stage.stageWidth * 0.5;
        dragCard.y = stage.stageHeight * 0.5;

        dragCard.addEventListener(Event.ENTER_FRAME , cardEnterFrameHandler)
    }

    private function cardEnterFrameHandler(event:Event):void {
        dragCard = Sprite(event.currentTarget);
        dragCard.x = mouseX;
        dragCard.y = mouseY;


        stage.addEventListener(MouseEvent.MOUSE_UP , mouseupHandler)

    }

    private function mouseupHandler(event:MouseEvent):void {

        removeChild(dragCard);


        stage.removeEventListener(MouseEvent.MOUSE_UP , mouseupHandler)
    }
}
}
