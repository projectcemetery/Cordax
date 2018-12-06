package cordax.ui;

import cordax.native.Element;
import cordax.layouts.Row;
import cordax.native.Element.RootElement;

/**
 * Base dialog
 */
class Dialog extends View {
}

/**
 * Simple dialog settings
 */
typedef SimpleDialogSettings = {
    var title:View;
	var content:View;    
}

/**
 * Simple dialog
 */
class SimpleDialog extends Dialog {
    /**
     * Dialog settings
     */
    public final settings:SimpleDialogSettings;

    /**
     * Constructor
     */
    public function new(settings:SimpleDialogSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
		var res = new RootElement(this);
        res.onClick = () -> {
            //Cordax.closeDialog(this);
        };

        var header = new Element("header");
        var title = settings.title.toElement();
        title.css.push("title");
        header.addChild(title);

        res.addChild(header);
        var content = settings.content.toElement();        
        res.addChild(content);
		return res;
	}
}