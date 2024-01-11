package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class StateA extends FlxState
{
	override public function create()
	{
		super.create();

		var t:FlxText = new FlxText(10, 10, FlxG.width, "State A\nPress 2 to go to State B\nPress 3 to go to State C");
		add(t);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new StateB());
		if (FlxG.keys.justPressed.THREE)
			FlxG.switchState(new StateC());
	}
}
