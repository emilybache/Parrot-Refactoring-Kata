struct Parrot<'a> {
    parrot_type: &'a str,
    number_of_coconuts: usize,
    voltage: f32,
    nailed: bool,
}

impl<'a> Parrot<'a> {
    pub fn speed(&self) -> Result<f32, &'static str> {
        match self.parrot_type {
            "european_parrot" => Ok(base_speed()),
            "african_parrot" => {
                let african_speed = base_speed() - load_factor() * self.number_of_coconuts as f32;
                if african_speed > 0.0 { Ok(african_speed) } else { Ok(0.0)}
            }
            "norwegian_blue_parrot" => {
                if self.nailed == true {
                    Ok(0.0)
                }
                else {
                    Ok(compute_base_speed_for_voltage(self.voltage))
                }
            }
            _ => Err("Should be unreachable!")
        }
    }
}

fn compute_base_speed_for_voltage(voltage: f32) -> f32 {
    let fixed_base_speed = 24.0;
    let base_speed_for_voltage = voltage * base_speed();
    if base_speed_for_voltage < fixed_base_speed {
        base_speed_for_voltage
    }
    else {
        fixed_base_speed
    }
}

fn load_factor() -> f32 {
    9.0
}

fn base_speed() -> f32 {
    12.0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn european_parrot_speed() {
        let parrot = Parrot { parrot_type: "european_parrot",
                              number_of_coconuts: 0,
                              voltage: 0.0,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 12.0);
    }

    #[test]
    fn african_parrot_speed_with_one_coconut() {
        let parrot = Parrot { parrot_type: "african_parrot",
                              number_of_coconuts: 1,
                              voltage: 0.0,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 3.0);
    }

    #[test]
    fn african_parrot_speed_with_two_coconut() {
        let parrot = Parrot { parrot_type: "african_parrot",
                              number_of_coconuts: 2,
                              voltage: 0.0,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 0.0);
    }

    #[test]
    fn african_parrot_speed_with_no_coconut() {
        let parrot = Parrot { parrot_type: "african_parrot",
                              number_of_coconuts: 0,
                              voltage: 0.0,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 12.0);
    }
    #[test]
    fn nailed_norwegian_blue_parrot() {
        let parrot = Parrot { parrot_type: "norwegian_blue_parrot",
                              number_of_coconuts: 0,
                              voltage: 1.5,
                              nailed: true };
        assert_eq!(parrot.speed().unwrap(), 0.0);
    }
    #[test]
    fn not_nailed_norwegian_blue_parrot() {
        let parrot = Parrot { parrot_type: "norwegian_blue_parrot",
                              number_of_coconuts: 0,
                              voltage: 1.5,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 18.0);
    }
    #[test]
    fn not_nailed_norwegian_blue_parrot_with_high_voltage() {
        let parrot = Parrot { parrot_type: "norwegian_blue_parrot",
                              number_of_coconuts: 0,
                              voltage: 4.0,
                              nailed: false };
        assert_eq!(parrot.speed().unwrap(), 24.0);
    }
}
