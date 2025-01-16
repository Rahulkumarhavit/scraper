-- CreateTable
CREATE TABLE `UserBalance` (
    `userId` VARCHAR(191) NOT NULL,
    `credits` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
