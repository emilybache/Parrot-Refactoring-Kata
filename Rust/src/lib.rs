enum ParrotType {
    European,
    African,
    NorwegianBlue,
}

struct Parrot {
    parrot_type: ParrotType,
    number_of_coconuts: usize,
    voltage: f32,
    nailed: bool,
}

impl Parrot {
    fn speed(&self) -> f32 {
        match self.parrot_type {
            ParrotType::European => base_speed(),
            ParrotType::African => {
                let african_speed = base_speed() - load_factor() * self.number_of_coconuts as f32;
                if african_speed > 0.0 {
                    african_speed
                } else {
                    0.0
                }
            }
            ParrotType::NorwegianBlue => {
                if self.nailed == true {
                    0.0
                } else {
                    compute_base_speed_for_voltage(self.voltage)
                }
            }
        }
    }

    fn get_cry(&self) -> &str {
        match self.parrot_type {
            ParrotType::European => "Sqoork!",
            ParrotType::African => "Sqaark!",
            ParrotType::NorwegianBlue => {
                if self.voltage > 0.0 {
                    "Bzzzzzz"
                } else {
                    "..."
                }
            }
        }
    }
}

fn compute_base_speed_for_voltage(voltage: f32) -> f32 {
    let fixed_base_speed = 24.0;
    let base_speed_for_voltage = voltage * base_speed();
    if base_speed_for_voltage < fixed_base_speed {
        base_speed_for_voltage
    } else {
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
        let parrot = Parrot {
            parrot_type: ParrotType::European,
            number_of_coconuts: 0,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 12.0);
    }

    #[test]
    fn african_parrot_speed_with_one_coconut() {
        let parrot = Parrot {
            parrot_type: ParrotType::African,
            number_of_coconuts: 1,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 3.0);
    }

    #[test]
    fn african_parrot_speed_with_two_coconut() {
        let parrot = Parrot {
            parrot_type: ParrotType::African,
            number_of_coconuts: 2,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 0.0);
    }

    #[test]
    fn african_parrot_speed_with_no_coconut() {
        let parrot = Parrot {
            parrot_type: ParrotType::African,
            number_of_coconuts: 0,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 12.0);
    }
    #[test]
    fn nailed_norwegian_blue_parrot() {
        let parrot = Parrot {
            parrot_type: ParrotType::NorwegianBlue,
            number_of_coconuts: 0,
            voltage: 1.5,
            nailed: true,
        };
        assert_eq!(parrot.speed(), 0.0);
    }
    #[test]
    fn not_nailed_norwegian_blue_parrot() {
        let parrot = Parrot {
            parrot_type: ParrotType::NorwegianBlue,
            number_of_coconuts: 0,
            voltage: 1.5,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 18.0);
    }
    #[test]
    fn not_nailed_norwegian_blue_parrot_with_high_voltage() {
        let parrot = Parrot {
            parrot_type: ParrotType::NorwegianBlue,
            number_of_coconuts: 0,
            voltage: 4.0,
            nailed: false,
        };
        assert_eq!(parrot.speed(), 24.0);
    }

    #[test]
    fn get_cry_of_european_parrot() {
        let parrot = Parrot {
            parrot_type: ParrotType::European,
            number_of_coconuts: 0,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.get_cry(), "Sqoork!");
    }

    #[test]
    fn get_cry_of_african_parrot() {
        let parrot = Parrot {
            parrot_type: ParrotType::African,
            number_of_coconuts: 0,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.get_cry(), "Sqaark!");
    }

    #[test]
    fn get_cry_norwegian_blue_parrot_high_voltage() {
        let parrot = Parrot {
            parrot_type: ParrotType::NorwegianBlue,
            number_of_coconuts: 0,
            voltage: 4.0,
            nailed: false,
        };
        assert_eq!(parrot.get_cry(), "Bzzzzzz");
    }

    #[test]
    fn get_cry_norwegian_blue_parrot_no_voltage() {
        let parrot = Parrot {
            parrot_type: ParrotType::NorwegianBlue,
            number_of_coconuts: 0,
            voltage: 0.0,
            nailed: false,
        };
        assert_eq!(parrot.get_cry(), "...");
    }
}
