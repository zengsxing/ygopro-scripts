--ジャンク・デストロイヤー
---@param c Card
function c74860293.initial_effect(c)
	aux.AddMaterialCodeList(c,63977008)
	--synchro summon
	aux.AddSynchroProcedure(c,c74860293.tfilter,aux.NonTuner(nil),1)
	c:EnableReviveLimit()
	--atkup
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(74860293,0))
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCondition(c74860293.con)
	e1:SetTarget(c74860293.tg)
	e1:SetOperation(c74860293.op)
	c:RegisterEffect(e1)
end
c74860293.material_setcode=0x1017
function c74860293.tfilter(c)
	return c:IsCode(63977008) or c:IsHasEffect(20932152)
end
function c74860293.con(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_SYNCHRO)
end
function c74860293.tg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() end
	local mc=e:GetHandler():GetMaterialCount()
	if chk==0 then return mc>1 and Duel.IsExistingTarget(aux.TRUE,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,aux.TRUE,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,mc-1,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
end
function c74860293.op(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS)
	local sg=g:Filter(Card.IsRelateToEffect,nil,e)
	Duel.Destroy(sg,REASON_EFFECT)
end
