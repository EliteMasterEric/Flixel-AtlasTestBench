package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class StateC extends FlxState
{
	override public function create()
	{
		super.create();

		var t:FlxText = new FlxText(10, 10, FlxG.width, "State C\nPress 1 to go to State A");
		add(t);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ONE)
			FlxG.switchState(new StateA());
	}
}
