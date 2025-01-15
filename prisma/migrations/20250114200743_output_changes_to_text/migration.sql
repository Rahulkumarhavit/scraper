/*
  Warnings:

  - Made the column `outputs` on table `executionphase` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `executionphase` MODIFY `outputs` TEXT NOT NULL;
