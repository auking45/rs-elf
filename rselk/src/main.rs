use std::{env, error::Error, fs};
use std::process::Command;

fn main() -> Result<(), Box<dyn Error>> {
    let input_path = env::args().nth(1).expect("usage: elk FILE");
    let input = fs::read(&input_path)?;

    let file = match rself::File::parse_or_print_error(&input[..]) {
        Some(f) => f,
        None => std::process::exit(1),
    };
    println!("{:#?}", file);

    println!("Executing {:?}...", input_path);

    let status = Command::new(input_path).status()?;
    if !status.success() {
        return Err("process did not exit successfully".into());
    }

    Ok(())
}
