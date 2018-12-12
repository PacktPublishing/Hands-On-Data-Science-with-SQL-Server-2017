select WhatHappens, Discontinued, count(*) as EventCount
from #res
group by WhatHappens, Discontinued