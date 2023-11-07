pub fn get_system_volume() -> String {
    let output = std::process::Command::new("amixer")
        .args(&["get", "Master"])
        .output()
        .expect("failed to execute process");
    let output = String::from_utf8_lossy(&output.stdout);
    let output = output.split_whitespace().collect::<Vec<&str>>();
    let volume = output[25].to_string();
    let volume = volume.replace("[", "");
    let volume = volume.replace("]", "");
    let volume = volume.replace("%", "");
    format!(" {}%", volume)
}
