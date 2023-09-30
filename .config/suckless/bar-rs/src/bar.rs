use crate::components;

struct Bar {
    display: *mut u8,
    root: *mut u8,
    command: String
}

#[allow(unused)]
impl Bar {
    fn new() -> Bar {
        let display = unsafe { XOpenDisplay(0 as *const u8) };
        let root = unsafe { XDefaultRootWindow(display) };

        /* HERE WILL GO ALL THE COMPONENTS */
        let date = components::date::get_date();
        let time = components::date::get_time();

        let command = format!("{} {}", date, time);

        Bar {
            display,
            root,
            command
        }
    }

    fn update(&mut self) {
        unsafe { XStoreName(self.display, self.root, self.command.as_ptr()) };
    }
}

#[link(name = "X11")]
extern "C" {
    // https://www.x.org/releases/X11R7.5/doc/man/man3/XOpenDisplay.3.html
    fn XOpenDisplay(display_name: *const u8) -> *mut u8;
    fn XDefaultRootWindow(display: *mut u8) -> *mut u8;
    fn XStoreName(display: *mut u8, w: *mut u8, name: *const u8) -> i32;
}

// pub fn display_bar() {
//     let mut bar = Bar::new();
//     loop {
//         bar.update();
//         std::thread::sleep(std::time::Duration::from_nanos((1e9 / 144.) as u64));
//     }
// }

pub fn display_bar() {
    let display = unsafe { XOpenDisplay(0 as *const u8) };
    let root = unsafe { XDefaultRootWindow(display) };
    loop {
        let date = components::date::get_date();
        let time = components::date::get_time();
        let battery = (components::battery::set_battery_charge()).to_string();
        let command = format!("{} {}  {}", battery, date, time);

        unsafe { XStoreName(display, root, command.as_ptr()) };

        std::thread::sleep(std::time::Duration::from_nanos((1e9 / 144.) as u64));
    }
}
