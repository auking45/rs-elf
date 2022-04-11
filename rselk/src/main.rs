use std::{env, error::Error, fs};

fn main() -> Result<(), Box<dyn Error>> {
    let input_path = env::args().nth(1).expect("usage: elk FILE");
    let input = fs::read(&input_path)?;

    let (_, file) = rself::File::parse(&input[..]).map_err(|e| format!("{:?}", e))?;
    println!("{:#?}", file);

    Ok(())
}
