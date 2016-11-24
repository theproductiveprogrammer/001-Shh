/**
* What's the best music for concentration?
*/

/**
 * https://youtu.be/fjeIHsWm5bw
 */

/**
 * Like many of you, I love
 * listening to music. So it's
 * always been a quest for me to
 * find the _*best and most*_
 * _*productive music*_ to listen
 * to. Is it Classical? Pop?
 * Rock?...DubStep!?
 */
/**
 * listening-to-music.png
 */

/**
 * My quest led me to multiple
 * answers. I tried [href=https://www.youtube.com/watch?v=ArwcHjmsw3A](white noise),
 * [href=https://www.youtube.com/watch?v=ZXtimhT-ff4](pink noise), [href=https://coffitivity.com/](coffee shop noise)
 * and they all helped to some
 * degree but began to get
 * boring.
 *
 * I tried nature sounds, sounds
 * of the forest, the desert,
 * the sea... (I think my lazy
 * ass must have heard every
 * place on earth!)
 *
 * The _*best*_ I found was the
 * amazing and wonderful size
 * [href=https://www.focusatwill.com](focus@will).  If you are on
 * that quest to find music that
 * you can work with - try it out.
 * It's great!
 */

/**
 * But in the end, they didn't
 * stick and I figured what the
 * problem was - the music just
 * wasn't as much fun as "real"
 * music. I longed for Rock!,
 * Pop!, even Dubstep! and so I
 * would relapse to listening to
 * them in the end.
 *
 * Oh woe! Would I ever find the
 * holy grail of musical
 * productivity?
 */

/**
 * holy-grail.png
 */

/**
 * Yes! I truly *did* find that holy
 * grail of musical melody and
 * I'm sharing it with you....
 *
 * The holy grail of music
 * productivity is....
 */
/**
 * *_Silence_*
 */

/**
 * Think of it this way -
 * whenever we listen _any_
 * sounds - our brain expends
 * some effort in processing it.
 *
 * For the "real", enjoyable,
 * music our brains are hugely
 * distracted and trying to
 * "hum along" with the song in
 * our heads.
 *
 * And while it is distracted by
 * having to process these
 * sounds, it is not giving it's
 * all to the task at hand.
 *
 */
/**
 * For many programming tasks -
 * _this is bad!_ Therefore,
 * whenever we need to focus and
 * get things done we need a
 * quite, undisturbed, silence.
 */

/**
 * But that's not the whole
 * story...
 */

/**
 * Everyone who has programmed
 * for a while knows that
 * programming is not just
 * thinking and being creative -
 * there is a *lot* of tedious
 * work to be done as well.
 *
 * There are times we need to
 * work like this - on
 * programming tasks that do not
 * need our full attention
 *
 * Boring, repetitive, tasks
 * that we need to get done but
 * which would go by much easier
 * if our brains were half
 * switched off.
 *
 * For these tasks, we can use
 * the normal, enjoyable music
 * we know and love!
 *
 * Isn't it great?!
 */

/**
 * *__In summary:
 *
 *  (a) When you need to
 *  concentrate, use
 *  no music and work in
 *  silence. Let your brain only
 *  focus on the task at hand.
 *
 *  (b) When doing tedious,
 *  boring work, that's the time
 *  to lift your spirit by
 *  listening to great music
 *  that you enjoy!
 *  __*
 */

/**
 * Try it and see if it works
 * for you. It's a simple and
 * powerful way to use music.
 *
 * Personally, I have found this
 * method of using music to be
 * both the most fun and the
 * most productive.
 */

/**
 * The last problem that I've
 * discovered is sometimes I
 * enjoy music so much that
 * there are days I just get
 * into the habit listening and
 * not bothering to turn it off
 * when I need to concentrate!
 */

/**
 * For example, this post should
 * have been written
 * _yesterday_. I've been lazy
 * and it's all
 * [href=http://www.maroon5.com/](Maroon 5)'s fault!
 */
/**
 * https://www.youtube.com/watch?v=09R8_2nJtjg
 */

/**
 * So what I figured was I'd
 * write a small application
 * that mutes the computer
 * volume whenever I need to
 * concentrate...
 */
/**
 * Shh.png
 */
/**
 * And when I say I no longer
 * need my full brain - goes
 * back to normal.
 */
/**
 * Shh-close.png
 */

/**
 * It's a simple, quick, and
 * easy way to let myself enjoy
 * music and instantly switch
 * over to a "concentration"
 * mode when I need it.
 */

/**
 * And that's what the rest of
 * this program is - a Swift
 * Application that stays in the
 * MenuBar and mutes the
 * computer volume on your Mac.
 */
/**
 * Shh-icon.png
 */

/**
 * [:imports:]
 */
import Cocoa
import AudioToolbox

/**
 * [!] Mute the volume on
 * startup and restore on
 * shutdown.
 *
 * [+] This class is a delegate
 * for the lifecycle events of
 * the application.
 * [ ] Mute the computer on
 * startup.
 * [ ] Unmute on shutdown
 */
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var shh: Shh = Shh()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        shh.mute()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        shh.unmute()
    }

}


/**
 * [=] Show the icon on the menu
 * bar along with an exit menu
 * item.
 * [ ] Show a menu icon
 * [ ] On clicking the
 *   "Finished using entire brain"
 * item, ask the application to
 * terminate.
 * The AppDelegate will handle
 * acutally muting and unmuting
 * so all this has to do is show
 * and terminate the app.
 */
class MenuBarController : NSObject {

    @IBOutlet weak var menuBarMenu: NSMenu!

    let menuBarItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    override func awakeFromNib() {
        menuBarItem.image = NSImage(named: "menuBarIcon")
        menuBarItem.title = "Shh..."
        menuBarItem.menu = menuBarMenu
    }


    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }

}


/**
 * [=] Mute and unmute the
 * computer
 * [+] Use AudioToolbox in order
 * to handle audio events.
 * [ ] Get the default audio
 * device
 * [ ] Save the existing volume.
 * [ ] When muting, set volume
 * to zero
 * [ ] When un-muting, reset to
 * saved volume.
 * [  -] The user can, obviously
 * set the volume while the
 * application is running. I
 * *could* prevent this but
 * it is pointless. To turn off
 * the application is very
 * simple and all it does is
 * remind you that you are now
 * "not using your entire
 * brain".
 * [  -] TODO: Does not handle
 * plugging/unplugging of headphone
 * between mute/unmute.
 */
class Shh {

    var oldvolume: Float32 = 0

    func mute() {
        let (objid,sz) = getDefaultAudioDevice()
        if sz > 0 {
            self.oldvolume = getVolume(objid: objid, sz: sz)
            setVolume(objid: objid, sz: sz, volume: 0)
        }
    }

    func unmute() {
        if self.oldvolume > 0 {
            let (objid,sz) = getDefaultAudioDevice()
            if sz > 0 {
                setVolume(objid: objid, sz: sz, volume: self.oldvolume)
            }
        }
    }

    func getDefaultAudioDevice() -> (AudioObjectID,UInt32) {
        var defaultOutputDeviceID = AudioDeviceID(0)
        var defaultOutputDeviceIDSize = UInt32(MemoryLayout.size(ofValue: defaultOutputDeviceID))

        var getDefaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
            mSelector: AudioObjectPropertySelector(kAudioHardwarePropertyDefaultOutputDevice),
            mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
            mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))

        let status = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &getDefaultOutputDevicePropertyAddress,
            0,
            nil,
            &defaultOutputDeviceIDSize,
            &defaultOutputDeviceID)

        if status == OSStatus(noErr) {
            return (defaultOutputDeviceID,defaultOutputDeviceIDSize)
        }

        return (0,0)
    }

    func getVolumePropertyAddress() -> AudioObjectPropertyAddress {
        return AudioObjectPropertyAddress(
            mSelector: kAudioHardwareServiceDeviceProperty_VirtualMasterVolume,
            mScope: kAudioDevicePropertyScopeOutput,
            mElement: kAudioObjectPropertyElementMaster
        )
    }

    func getVolume(objid: AudioObjectID, sz: UInt32) -> Float32 {

        var volumePropertyAddress = getVolumePropertyAddress()

        var volume: Float32 = -1
        var volsz = UInt32(MemoryLayout.size(ofValue: volume))

        let status = AudioObjectGetPropertyData(objid, &volumePropertyAddress, 0, nil, &volsz, &volume)

        if status == OSStatus(noErr) {
            return volume
        }
        return -1
    }

    func setVolume(objid: AudioObjectID, sz: UInt32, volume: Float32) {
        var volumePropertyAddress = getVolumePropertyAddress()
        var voldt = volume
        let volsz = UInt32(MemoryLayout.size(ofValue: voldt))
        AudioObjectSetPropertyData(objid, &volumePropertyAddress, 0, nil, volsz, &voldt)
    }

}
