% testImgs: function used to call trainAndTest for every image
function [] = testImgs(varargin)
	nbarg = length(varargin);
	if nbarg == 0
		return
	end

	for arg_i = 1:nbarg
		trainAndTest(varargin{arg_i});
    end
end