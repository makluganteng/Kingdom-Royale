use dojo_examples::constants::{LAND_TYPE};

#[derive(Component, Copy, Drop, Serde, SerdeLen, Felt252Dict)]
struct Tile {
    #[key]
    game_id: u32,
    #[key]
    index: u32,
    _type: u8,
    x: u32,
    y: u32,
}

trait TileTrait {
    fn new(x: u32, y: u32) -> Tile;
    fn is_equal(self: Tile, b: Tile) -> bool;
    fn is_land(self: Tile) -> bool;
}

impl TraitImpl of TileTrait {
    fn new(x: u32, y: u32) -> Tile {
        Tile { game_id: 0, index: 0, _type: 0, x: x, y: y }
    }

    fn is_equal(self: Tile, b: Tile) -> bool {
        self.x == b.x && self.y == b.y
    }

    fn is_land(self: Tile) -> bool {
        self._type == LAND_TYPE
    }
}

#[cfg(test)]
mod tests {
    use super::{Tile, TileTrait};

    #[test]
    fn test_tile() {
        let expected = Tile { game_id: 0, index: 0, _type: 0, x: 1, y: 2 };
        let tile = TileTrait::new(1, 2);
        assert(tile.is_equal(expected), 'new failed');
    }
}
