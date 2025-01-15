-- CreateTable
CREATE TABLE `ExecutionLog` (
    `id` VARCHAR(191) NOT NULL,
    `logLevel` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `timestamp` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `executionPhaseId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ExecutionLog` ADD CONSTRAINT `ExecutionLog_executionPhaseId_fkey` FOREIGN KEY (`executionPhaseId`) REFERENCES `ExecutionPhase`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
