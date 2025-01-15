-- CreateTable
CREATE TABLE `WorkflowExecution` (
    `id` VARCHAR(191) NOT NULL,
    `workflowId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `trigger` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `startedAt` DATETIME(3) NULL,
    `completedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ExecutionPhase` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `number` INTEGER NOT NULL,
    `node` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `startedAt` DATETIME(3) NULL,
    `completedAt` DATETIME(3) NULL,
    `inputs` VARCHAR(191) NULL,
    `outputs` VARCHAR(191) NULL,
    `creditsCost` INTEGER NULL,
    `workflowExecutionId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `WorkflowExecution` ADD CONSTRAINT `WorkflowExecution_workflowId_fkey` FOREIGN KEY (`workflowId`) REFERENCES `Workflow`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExecutionPhase` ADD CONSTRAINT `ExecutionPhase_workflowExecutionId_fkey` FOREIGN KEY (`workflowExecutionId`) REFERENCES `WorkflowExecution`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
