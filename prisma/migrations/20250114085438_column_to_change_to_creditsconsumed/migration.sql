/*
  Warnings:

  - You are about to drop the column `creditsCost` on the `executionphase` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `executionphase` DROP COLUMN `creditsCost`,
    ADD COLUMN `creditsConsumed` INTEGER NULL;
