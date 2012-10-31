# Reason for Existence

SafeToUnplug is a tiny faceless background app that notifies you (via 10.8's Notification Center) when it's actually safe to unplug a newly-unmounted drive.

For some reason Finder (seen last on OS X 10.8.2) sometimes dismisses a volume's icon from it's UI while the system is still actively unmounting it. Unplugging a drive while it's busy flushing its buffers is a great way to corrupt data.

# Installation

Compile it yourself or snag the precompiled binary.

I recommend you add it as a Login Item (System Preferences > Users & Groups > Current User > Login Items.

# Credits

I was alerted to this SafeToUnplug implementation technique by [Peter Hosey](https://twitter.com/boredzo/status/263341185802858497). The code is mostly stolen from [Ullrich Schaefer's](https://twitter.com/stigi) [Stackoverflow answer](http://stackoverflow.com/a/1410174/5260).

# TODO?

* I'm running 10.8, so I just used Notification Center directly. If someone sends me a patch to use Growl instead and/or make SafeToUnplug run on earlier systems that would be swell.

* Disk Arbitration has [`DARegisterDiskDisappearedCallback`](http://developer.apple.com/library/mac/#documentation/DiskArbitration/Reference/DiskArbitration_header_reference/Reference/reference.html#//apple_ref/doc/uid/TP40011617). Looks lower-level. Should I use it instead of `name:NSWorkspaceDidUnmountNotification`?

# Version History

### v1.0: Tue Oct 30 2012 [download](https://github.com/downloads/rentzsch/SafeToUnplug/SafeToUnplug-1.0.zip)

* Initial release.