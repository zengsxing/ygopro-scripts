--幻影王 ハイド・ライド
---@param c Card
function c6901008.initial_effect(c)
	--nontuner
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_NONTUNER)
	e1:SetValue(c6901008.tnval)
	c:RegisterEffect(e1)
end
function c6901008.tnval(e,c)
	return e:GetHandler():IsControler(c:GetControler())
end
