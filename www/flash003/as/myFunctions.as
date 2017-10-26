Stage.scaleMode = "noScale";
Stage.align = "TL";

//import engine fuse **********************************************************************
import com.mosesSupposes.fuse.*;
ZigoEngine.simpleSetup(Shortcuts, PennerEasing, Fuse, FuseFMP);

//Function to place objects on the stage **************************************************
function toStage(mc:MovieClip, xPos:Number, yPos:Number, mcWidth:Number, mcHeight:Number) {
	mc._x = Math.floor(xPos);
	mc._y = Math.floor(yPos);
	mc._width = mcWidth;
	mc._height = mcHeight;
}