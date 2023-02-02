/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;


var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;
// write 'product' node to workflow context
$.context.product = product;
*/

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;

// create new node 'Aprovacao'
var Aprovacao = {
		Aprovacao: lastUserTask1.decision
};
$.context = Aprovacao;

