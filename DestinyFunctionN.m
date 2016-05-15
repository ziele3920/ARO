function result = DestinyFunctionN(mi, sig, value)

result = 1/(sig*sqrt(2*pi)) * exp(-(value-mi)^2/(2*sig^2));

end