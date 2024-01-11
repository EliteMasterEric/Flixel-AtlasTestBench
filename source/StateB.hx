package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;

class StateB extends FlxState
{
	var char:FlxSprite;

	override public function create()
	{
		super.create();

		var t:FlxText = new FlxText(10, 10, FlxG.width, "State B\nPress 1 to go to State A");
		add(t);

		var t2:FlxText = new FlxText(10, 10, FlxG.width - 20, "Press Up/Down/Left/Right to sing\nPress Space to game over (uses second atlas)");
		t2.alignment = RIGHT;
		add(t2);

		char = new FlxSprite(0, 0);

		var charFrames:FlxAtlasFrames = FlxAtlasFrames.fromSparrow('assets/images/bf-and-gf/bfAndGF.png', 'assets/images/bf-and-gf/bfAndGF.xml');
		var deathFrames:FlxAtlasFrames = FlxAtlasFrames.fromSparrow('assets/images/bf-and-gf/bfAndGF-DEAD.png', 'assets/images/bf-and-gf/bfAndGF-DEAD.xml');

		charFrames.addAtlas(deathFrames);

		char.frames = charFrames;

		char.animation.addByPrefix('idle', 'BF idle dance w gf0', 24, true, false, false);
		char.animation.addByPrefix('singDown', "BF NOTE DOWN0", 24, false, false, false);
		char.animation.addByPrefix('singLeft', "BF NOTE LEFT0", 24, false, false, false);
		char.animation.addByPrefix('singRight', "BF NOTE RIGHT0", 24, false, false, false);
		char.animation.addByPrefix('singUp', "BF NOTE UP0", 24, false, false, false);

		char.animation.addByPrefix('death', "BF Dies with GF0", 24, false, false, false);
		char.animation.addByPrefix('deathLoop', "BF Dead with GF Loop0", 24, true, false, false);

		char.animation.play('idle');

		char.animation.finishCallback = function(finishedAnim:String):Void
		{
			if (finishedAnim == 'death')
				char.animation.play('deathLoop');
			else
				char.animation.play('idle');
		};

		char.scale.set(0.5, 0.5);
		char.updateHitbox();
		char.screenCenter(XY);
		char.antialiasing = true;
		add(char);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ONE)
			FlxG.switchState(new StateA());

		if (FlxG.keys.justPressed.LEFT)
			char.animation.play('singLeft', true);

		if (FlxG.keys.justPressed.RIGHT)
			char.animation.play('singRight', true);

		if (FlxG.keys.justPressed.UP)
			char.animation.play('singUp', true);

		if (FlxG.keys.justPressed.DOWN)
			char.animation.play('singDown', true);

		if (FlxG.keys.justPressed.SPACE)
			char.animation.play('death', true);
	}
}
