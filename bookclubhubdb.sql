CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    user_id VARCHAR(50) UNIQUE,
    profile_pic VARCHAR(255),
    genres VARCHAR(255),
    otp VARCHAR(10),
    otp_expires_at DATETIME,
    verified BOOLEAN DEFAULT FALSE,
    token VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reset_token VARCHAR(255),
    reset_token_expiry DATETIME
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    description TEXT,
    cover VARCHAR(255)
);

CREATE TABLE otp_temp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    otp VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    INDEX (email),
    INDEX (expires_at)
);


INSERT INTO books (title, author, description, cover) VALUES
('The Hobbit', 'J.R.R. Tolkien', 'Bilbo Baggins, a comfort-loving hobbit, is swept into an epic quest to reclaim a lost dwarf kingdom from the dragon Smaug.', 'https://m.media-amazon.com/images/I/51oZneFTrlL._SY445_SX342_.jpg'),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'An orphan discovers he\'s a wizard and attends Hogwarts, where he uncovers his magical destiny and a dark past.', 'https://m.media-amazon.com/images/I/5152XTq24+L._SY445_SX342_.jpg'),
('Eragon', 'Christopher Paolini', 'A farm boy finds a mysterious stone that hatches into a dragon, thrusting him into a world of magic and war.', 'https://m.media-amazon.com/images/I/51i7mXy61VL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Name of the Wind', 'Patrick Rothfuss', 'Kvothe, a gifted young man, grows from a street urchin to a legendary figure through hardship and knowledge.', 'https://m.media-amazon.com/images/I/51mOzK1tVjL._SY445_SX342_.jpg'),
('Mistborn: The Final Empire', 'Brandon Sanderson', 'A dark world ruled by a god-emperor is turned upside down by a young thief with the power to control metals.', 'https://m.media-amazon.com/images/I/61rYqiz8yJL._SY445_SX342_QL70_FMwebp_.jpg'),
('A Game of Thrones', 'George R.R. Martin', 'Noble families vie for the Iron Throne in a land where summer lasts decades—and winter can last a lifetime.', 'https://m.media-amazon.com/images/I/61we8FyJbSL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Way of Kings', 'Brandon Sanderson', 'In a storm-wracked world, a broken soldier becomes a legend in a battle for salvation and truth. Book one of the Stormlight Archive.', 'https://m.media-amazon.com/images/I/51hAwcG3oNL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Lies of Locke Lamora', 'Scott Lynch', 'A cunning thief leads a gang of con artists through the gritty streets of Camorr in this dark, witty fantasy adventure.', 'https://m.media-amazon.com/images/I/51PdxX6fr1L._SY445_SX342_.jpg'),
('Throne of Glass', 'Sarah J. Maas', 'An imprisoned assassin is offered her freedom if she can win a deadly competition—and uncover a sinister threat to the kingdom.', 'https://m.media-amazon.com/images/I/41wbhGixAIL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Priory of the Orange Tree', 'Samantha Shannon', 'A sprawling feminist epic of dragons, queens, and ancient evil where kingdoms must unite to stop an age-old terror.', 'https://m.media-amazon.com/images/I/61jH5OcyPYL._SY445_SX342_.jpg'),
('Children of Blood and Bone', 'Tomi Adeyemi', 'In a world where magic was stolen, a young girl fights to bring it back and restore her people\'s legacy.', 'https://m.media-amazon.com/images/I/61Zxem3qIIL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Cruel Prince', 'Holly Black', 'Jude, a mortal girl, is thrust into the treacherous world of Faerie, where betrayal and ambition define power and survival.', 'https://m.media-amazon.com/images/I/61pbljMRMlL._SY445_SX342_QL70_FMwebp_.jpg'),
('To Kill a Mockingbird', 'Harper Lee', 'Set in the American South during the 1930s, this Pulitzer Prize-winning novel follows young Scout Finch as her father, Atticus, defends a Black man wrongly accused of rape, exploring themes of racial injustice and moral growth.', 'https://m.media-amazon.com/images/I/71FxgtFKcQL._AC_UF1000,1000_QL80_.jpg'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'A portrait of the Jazz Age in all of its decadence and excess, Gatsby\'s story follows the pursuit of wealth, status, and the American Dream through the eyes of narrator Nick Carraway.', 'https://m.media-amazon.com/images/I/71FTb9X6wsL._AC_UF1000,1000_QL80_.jpg'),
('1984', 'George Orwell', 'In a dystopian future where the government controls reality through surveillance, propaganda, and thought control, Winston Smith dares to think and love independently.', 'https://m.media-amazon.com/images/I/61ZewDE3beL._AC_UF1000,1000_QL80_.jpg'),
('The Catcher in the Rye', 'J.D. Salinger', 'Holden Caulfield\'s cynical yet vulnerable voice narrates this coming-of-age story about teenage alienation and the loss of innocence in post-war America.', 'https://imgcdn.saxo.com/_9780241984758'),
('Beloved', 'Toni Morrison', 'This Pulitzer Prize-winning novel tells the haunting story of Sethe, a former slave haunted by the ghost of her baby daughter, exploring the trauma of slavery\'s legacy.', 'https://imgcdn.saxo.com/_9780099760115'),
('The Book Thief', 'Markus Zusak', 'Narrated by Death, this novel follows Liesel Meminger, a young girl in Nazi Germany who finds solace by stealing books and sharing them with others during WWII.', 'https://imgcdn.saxo.com/_9780375842207'),
('The Kite Runner', 'Khaled Hosseini', 'A powerful story of friendship, betrayal, and redemption set against Afghanistan\'s turbulent history from the fall of the monarchy to the Taliban regime.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1541428344i/17165596.jpg'),
('Little Fires Everywhere', 'Celeste Ng', 'In Shaker Heights, a placid suburb of Cleveland, a custody battle over a Chinese-American baby divides the town and exposes the fault lines of race and class.', 'https://imgcdn.saxo.com/_9780349142920'),
('Where the Crawdads Sing', 'Delia Owens', 'A murder mystery and coming-of-age story about Kya, the "Marsh Girl" who survives alone in the North Carolina coastal wilderness, becoming a suspect when a local man is found dead.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1582135294i/36809135.jpg'),
('Normal People', 'Sally Rooney', 'The story of mutual fascination between Marianne and Connell follows them from high school in a small Irish town to university at Trinity College, exploring their complex relationship.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsicQ6UfVUVjq1276rZ0wXH-noAKvwScxcsQ&s'),
('Pride and Prejudice', 'Jane Austen', 'A classic tale set in Regency England, following Elizabeth Bennet as she navigates societal expectations, love, and misunderstandings with the proud Mr. Darcy.', 'https://m.media-amazon.com/images/I/510K7xiy6SL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Notebook', 'Nicholas Sparks', 'A deeply emotional story of lifelong love and memory, chronicling the romance between Noah and Allie across decades, challenges, and life\'s uncertainties.', 'https://m.media-amazon.com/images/I/61XEadq7R9L._SY445_SX342_QL70_FMwebp_.jpg'),
('Me Before You', 'Jojo Moyes', 'A heartfelt romance that explores love, loss, and the impact of making difficult choices when Louisa unexpectedly enters Will\'s life after a tragic accident.', 'https://m.media-amazon.com/images/I/41RcepPXgpL._SY445_SX342_QL70_FMwebp_.jpg'),
('Outlander', 'Diana Gabaldon', 'Time-travel romance blending history and passion as Claire Randall, a WWII nurse, finds herself transported to 18th-century Scotland and torn between two lives.', 'https://m.media-amazon.com/images/I/7126BdiWSuL._SX342_.jpg'),
('Twilight', 'Stephenie Meyer', 'A modern paranormal romance featuring Bella Swan and vampire Edward Cullen, exploring themes of love, danger, and the supernatural.', 'https://m.media-amazon.com/images/I/41nWb6aqWoL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Rosie Project', 'Graeme Simsion', 'A charming and quirky love story about Don, a genetics professor with social difficulties, who creates a scientific survey to find a perfect partner — but love surprises him.', 'https://m.media-amazon.com/images/I/51NckoA5ncL._SY445_SX342_QL70_FMwebp_.jpg'),
('Eleanor & Park', 'Rainbow Rowell', 'A tender story of first love between two misfit teenagers in the 1980s, exploring the complexities of family, acceptance, and finding your place.', 'https://m.media-amazon.com/images/I/4111bkkLKpL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Kiss Quotient', 'Helen Hoang', 'A heartfelt and sexy romance featuring Stella, a woman with Asperger\'s who hires an escort to help her understand relationships and intimacy — sparking unexpected feelings.', 'https://m.media-amazon.com/images/I/51Q+y44Mn1L._SY300_SX300_.jpg'),
('Jane Eyre', 'Charlotte Brontë', 'A gothic romance about the strong-willed orphan Jane Eyre and her turbulent love for the mysterious Mr. Rochester, filled with secrets and moral struggles.', 'https://m.media-amazon.com/images/I/51YMxWjhf7L._SY445_SX342_QL70_FMwebp_.jpg'),
('Anna Karenina', 'Leo Tolstoy', 'A sweeping Russian novel of passion, betrayal, and tragedy following Anna\'s doomed love affair and the complexities of Russian high society.', 'https://m.media-amazon.com/images/I/81WSsp23I1L._SX342_.jpg'),
('Sense and Sensibility', 'Jane Austen', 'The story of two sisters with contrasting temperaments facing love, heartbreak, and societal pressures in 19th-century England.', 'https://m.media-amazon.com/images/I/51jWomcWeVL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Fault in Our Stars', 'John Green', 'A poignant young adult love story about two teenagers facing illness, hope, and the bittersweetness of first love.', 'https://m.media-amazon.com/images/I/41x0pn4T3fL._SY445_SX342_QL70_FMwebp_.jpg'),
('Beautiful Disaster', 'Jamie McGuire', 'A passionate and intense romance between good girl Abby and bad boy Travis, full of drama, passion, and second chances.', 'https://m.media-amazon.com/images/I/517NcNv6x7L._SY445_SX342_QL70_FMwebp_.jpg'),
('Red Queen', 'Victoria Aveyard', 'A young woman with a dangerous power is thrust into a world of political intrigue, romance, and rebellion in this fantasy romance thriller.', 'https://m.media-amazon.com/images/I/41y6nsCKA-L._SY445_SX342_QL70_FMwebp_.jpg'),
('The Hating Game', 'Sally Thorne', 'A witty office romance about two coworkers whose rivalry hides deeper feelings, leading to unexpected passion.', 'https://m.media-amazon.com/images/I/412UYfMfgLL._SY445_SX342_QL70_FMwebp_.jpg'),
('The Time Traveler\'s Wife', 'Audrey Niffenegger', 'A unique love story about Henry, a man with a rare time-traveling condition, and Clare, his wife, whose love endures despite impossible obstacles.', 'https://m.media-amazon.com/images/I/51tWSYoUrjL._SY445_SX342_QL70_FMwebp_.jpg');