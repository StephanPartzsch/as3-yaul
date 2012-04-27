package de.hopa.yaul.display
{
	import flash.events.Event;
	import flash.display.Sprite;

	public class ClickCatcher extends Sprite
	{
		public function ClickCatcher()
		{
			addStageListener();
		}

		private function addStageListener() : void
		{
			addEventListener( Event.ADDED_TO_STAGE, handleAddedToStage );
			addEventListener( Event.REMOVED_FROM_STAGE, handleRemovedFromStage );
		}

		private function handleAddedToStage( event : Event ) : void
		{
			updateHitArea();
			stage.addEventListener( Event.RESIZE, handleResize );
		}

		private function handleRemovedFromStage( event : Event ) : void
		{
			stage.removeEventListener( Event.RESIZE, handleResize );
		}

		private function handleResize( event : Event ) : void
		{
			updateHitArea();
		}

		private function updateHitArea() : void
		{
			if ( hitArea == null )
				createHitArea();

			hitArea.graphics.clear();
			hitArea.graphics.beginFill( 0x0 );
			hitArea.graphics.drawRect( 0, 0, stage.stageWidth, stage.stageHeight );
			hitArea.graphics.endFill();
		}

		private function createHitArea() : void
		{
			var hitArea : Sprite = new Sprite();
			hitArea.visible = false;
			addChild( hitArea );
			this.hitArea = hitArea;
		}
	}
}