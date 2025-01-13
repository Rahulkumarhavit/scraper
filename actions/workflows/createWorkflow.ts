"use server"

import prisma from "@/lib/prisma";
import { CreateFlowNode } from "@/lib/workflow/createFlowNode";
import { createWorkflowSchema, createWorkflowSchemaType } from "@/schema/workflow"
import { AppNode } from "@/types/appNode";
import { TaskType } from "@/types/task";
import { workflowStatus } from "@/types/workflow";
import { auth } from "@clerk/nextjs/server";
import { Edge } from "@xyflow/react";
import { redirect } from "next/navigation";
import { z } from "zod"

export async function CreateWorkFlow( form:createWorkflowSchemaType){
    const {success,data}= createWorkflowSchema.safeParse(form);
    if(!success){
        throw new Error("Invalid form data");
    }

    const {userId} = auth();
    if(!userId){
        throw new Error("unauthenticated");
    }

    const initialFlow:{ nodes: AppNode[], edges:Edge[]} = {
        nodes:[],
        edges:[],
    };

    initialFlow.nodes.push(CreateFlowNode(TaskType.LAUNCH_BROWSER));

    const result  = await prisma.workflow.create({
        data:{
            userId,
            status:workflowStatus.DRAFT,
            definition:JSON.stringify(initialFlow),
            ...data
        }
    })
    if(!result){
        throw new Error("failed to create workflow")
    }

    redirect(`/workflow/editor/${result.id}`)
}
   