use crate::components::date;

// insert components/date.rs
#[link(name = "X11")]
extern "C" {
    // https://www.x.org/releases/X11R7.5/doc/man/man3/XOpenDisplay.3.html
    fn XOpenDisplay(display_name: *const u8) -> *mut u8;
    fn XDefaultRootWindow(display: *mut u8) -> *mut u8;
    fn XStoreName(display: *mut u8, w: *mut u8, name: *const u8) -> i32;
}

pub fn display_bar() {
    let display = unsafe { XOpenDisplay(0 as *const u8) };
    let root = unsafe { XDefaultRootWindow(display) };
    let date = date::get_date();
    loop {
        unsafe { XStoreName(display, root, "Hi\0".as_ptr()) };
        unsafe { XStoreName(display, root, date.as_ptr()) };
    
        std::thread::sleep(std::time::Duration::from_nanos((1e9 / 144.) as u64));
    }
}
