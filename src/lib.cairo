#[starknet::interface]
pub trait Istudentdatabase<TContractState> {
    fn storedata(ref self: TContractState, name: felt252, age: u16);
    fn getData(self: @TContractState) -> (felt252, u16);
}

#[starknet::contract]
mod studentdatabase {
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

    #[storage]
    struct Storage {
        name: felt252,
        age: u16,
    }

    #[abi(embed_v0)]
    impl studentdatabaseImpl of super::Istudentdatabase<ContractState> {
        fn storedata(ref self: ContractState, name: felt252, age: u16) {
            let student_name = self.name.read();
            self.name.write(student_name);

            let student_age = self.age.read();
            self.age.write(student_age);
        }

    fn getData(self: @ContractState) -> (felt252, u16) {
            let name = self.name.read();
            let age = self.age.read();
            return(name, age);
        }
    }
}
