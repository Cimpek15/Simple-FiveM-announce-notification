# Simple FiveM announce notification


From [@Jeva](https://github.com/jevajs) tutorial

So welcome to my first repo. It's not too complicated. It displays an advertisement written by us to all players on the server with a notification that looks like this: 

![Notification](https://i.imgur.com/9blj2zK.png)


## Change the notification icon

In the seventh line, by changing the argument for dictionary - ```helicopterhud``` and the argument for the name of the texture - ```targetlost```, you can set any notification icon


```lua
TriggerClientEvent('notify', -1, 'helicopterhud', 'targetlost', false, 2, '~h~Announcement', '~r~' .. param)
```


The list of icons loaded by default by GTA can be found [here](https://wiki.rage.mp/index.php?title=Notification_Pictures) and [here](https://wiki.rage.mp/index.php?title=Textures).

For more information on styling notifications (including custom icons), [see here](https://wiki.rage.mp/index.php?title=Ui::setNotificationMessage)
