package mx.infotec.dads.kukulkan.grammar;

import mx.infotec.dads.kukulkan.grammar.kukulkanParser.BlobFieldTypeContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.BooleanFieldTypeContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.CardinalityContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.DateFieldTypeContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.EntityContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.EntityFieldContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.NumericFieldTypeContext;
import mx.infotec.dads.kukulkan.grammar.kukulkanParser.StringFieldTypeContext;

/**
 * KukulkanCustomVisitor, this is the main visitor for kukulkan grammar
 * 
 * @author Daniel Cortes Pichardo
 *
 */
public class KukulkanCustomVisitor extends kukulkanParserBaseVisitor<Object> {
    /*
     * (non-Javadoc)
     * 
     * @see mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitEntity(mx.
     * infotec.dads.kukulkan.grammar.kukulkanParser.EntityContext)
     */
    @Override
    public Object visitEntity(EntityContext ctx) {
        return super.visitEntity(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitEntityField(mx.
     * infotec.dads.kukulkan.grammar.kukulkanParser.EntityFieldContext)
     */
    @Override
    public Object visitEntityField(EntityFieldContext ctx) {
        return super.visitEntityField(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitStringFieldType
     * (mx.infotec.dads.kukulkan.grammar.kukulkanParser.StringFieldTypeContext)
     */
    @Override
    public Object visitStringFieldType(StringFieldTypeContext ctx) {
        return super.visitStringFieldType(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitDateFieldType(
     * mx.infotec.dads.kukulkan.grammar.kukulkanParser.DateFieldTypeContext)
     */
    @Override
    public Object visitDateFieldType(DateFieldTypeContext ctx) {
        return super.visitDateFieldType(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#
     * visitNumericFieldType(mx.infotec.dads.kukulkan.grammar.kukulkanParser.
     * NumericFieldTypeContext)
     */
    @Override
    public Object visitNumericFieldType(NumericFieldTypeContext ctx) {
        return super.visitNumericFieldType(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitBlobFieldType(
     * mx.infotec.dads.kukulkan.grammar.kukulkanParser.BlobFieldTypeContext)
     */
    @Override
    public Object visitBlobFieldType(BlobFieldTypeContext ctx) {
        return super.visitBlobFieldType(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#
     * visitBooleanFieldType(mx.infotec.dads.kukulkan.grammar.kukulkanParser.
     * BooleanFieldTypeContext)
     */
    @Override
    public Object visitBooleanFieldType(BooleanFieldTypeContext ctx) {
        return super.visitBooleanFieldType(ctx);
    }

    /**
     * Visit Constraints.
     *
     * @param ctx
     *            the ctx
     * @return the visitor context
     */
    @Override
    public Object visitRequiredValidator(kukulkanParser.RequiredValidatorContext ctx) {
        return super.visitChildren(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#
     * visitPatternValidator(mx.infotec.dads.kukulkan.grammar.kukulkanParser.
     * PatternValidatorContext)
     */
    @Override
    public Object visitPatternValidator(kukulkanParser.PatternValidatorContext ctx) {
        return super.visitChildren(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitMinValidator(mx
     * .infotec.dads.kukulkan.grammar.kukulkanParser.MinValidatorContext)
     */
    @Override
    public Object visitMinValidator(kukulkanParser.MinValidatorContext ctx) {
        return super.visitChildren(ctx);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * mx.infotec.dads.kukulkan.grammar.kukulkanBaseVisitor#visitMaxValidator(mx
     * .infotec.dads.kukulkan.grammar.kukulkanParser.MaxValidatorContext)
     */
    @Override
    public Object visitMaxValidator(kukulkanParser.MaxValidatorContext ctx) {
        return super.visitChildren(ctx);
    }

    @Override
    public Object visitCardinality(CardinalityContext ctx) {
        System.out.println(ctx.getText());
        return super.visitCardinality(ctx);
    }
}
