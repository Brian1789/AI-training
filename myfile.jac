import:py from mtllm.llms, OpenAI;

glob llm = OpenAI();

node person {
    has name: str;
    has age: int;
    has skills: list[str] = [];
    
    can introduce {
        print(f"Hi! I'm {self.name}, {self.age} years old.");
        if self.skills {
            print(f"My skills include: {', '.join(self.skills)}");
        }
    }
}

walker greet_people {
    can visit_person with person entry {
        here.introduce();
    }
}

with entry {
    # Create some people
    alice = person(name="Alice", age=30, skills=["Python", "Machine Learning"]);
    bob = person(name="Bob", age=25, skills=["JavaScript", "Web Development"]);
    
    # Greet them
    walker = greet_people();
    walker visit alice;
    walker visit bob;
    
    print("Welcome to Jac programming!");
}