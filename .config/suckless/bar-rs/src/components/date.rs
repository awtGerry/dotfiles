pub fn get_date() -> String {
    let now = chrono::Local::now();
    now.format("%Y-%m-%d").to_string()
}
