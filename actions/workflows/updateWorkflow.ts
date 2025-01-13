"use server"

import prisma from "@/lib/prisma";
import { workflowStatus } from "@/types/workflow";
import { auth } from "@clerk/nextjs/server";
import { revalidatePath } from "next/cache";

export async function UpdateWorkflow({
    id,
    definition,
}:{
    id:string;
    definition:string;
}){
    const {userId} = auth();
    if(!userId){
        throw new Error("unauthenticated")
    }
    
    const workflow = await prisma.workflow.findUnique({
        where:{
            id,
            userId,
        },
    })
    if(!workflow) {
        throw new Error("Workflow not found");
    }
    if(workflow.status !== workflowStatus.DRAFT) {
        throw new Error("Wrokflow is not draft")
    }
    await prisma.workflow.update({
        data:{
            definition,
        },
        where:{
            id,
            userId,
        }
    })
    revalidatePath("/workflows");
}