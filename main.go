package main

import (
	"./parser"
	"fmt"
	"github.com/antlr/antlr4/runtime/Go/antlr"
	"os"
)

type TreeShapeListener struct {
	*parser.BasePolhListener
}

func NewTreeShapeListener() *TreeShapeListener {
	return new(TreeShapeListener)
}

func (this *TreeShapeListener) EnterEveryRule(ctx antlr.ParserRuleContext) {
	fmt.Println(ctx.GetText())
}

func main() {
	input := antlr.NewFileStream(os.Args[1])
	lexer := parser.NewPolhLexer(input)
	stream := antlr.NewCommonTokenStream(lexer, 0)
	p := parser.NewPolhParser(stream)
	p.AddErrorListener(antlr.NewDiagnosticErrorListener(true))
	p.BuildParseTrees = true
	tree := p.Program()
	antlr.ParseTreeWalkerDefault.Walk(NewTreeShapeListener(), tree)
}
