Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E43F4847;
	Fri, 31 Jul 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514341; cv=none; b=WTSK7+nBNL/oaoWuOm3f6RoHsOVPt6Yt3DX3+qxuSTnbNmuhfu6Btl2fmQNTwf1rPIaKhNQjG/AuVjc874OjNvRxVMvszZwE+LE7tOS1nf/JWaDbnWLaJXu+bLnBhKcm7IUepRhK/fg1ThWCMUsSEbk1G8lt/UqXnk4gRtCwP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514341; c=relaxed/simple;
	bh=pQJj6IdSFxz7K3VTYnzqOoKXxV/f6EG2d3sG+6MuLIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTsTGlD5ShkHP38HDfTvpBrFSnFE5zHwws1Y3CehwlrSyAQ4wcs4txzU/DUwnBeN1bMgPAf3o7fxlKIZ4WpyXQ6FjNIy45STNQrju1iNHqYLAt1JsGJyUbp3QTQJ6762t6KDFVZw7ICV42m3JPTlCtrWY4JLZI0Eg/FuQT06ti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A561F00AC4;
	Fri, 31 Jul 2026 16:12:15 +0000 (UTC)
Message-ID: <70e144cc-3c8e-473f-9a1c-b478d1dc5a6e@tuxon.dev>
Date: Fri, 31 Jul 2026 19:12:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 biju.das.jz@bp.renesas.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/31/26 10:01, Tommaso Merciai wrote:
> renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> from cmd->rx_count, which the response ISR sets to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already means
> "every address was assigned", so a timed out transfer leaves that value
> in place and it gets used as a result.
> 
> On a bus with no target connected the ENTDAA times out and the driver
> registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> the core two seconds on a GETPID that can only time out:
> 
>    i3c i3c-0: Failed to add I3C device at address 9, error -110
>    ...
>    i3c i3c-0: Failed to add I3C device at address 16, error -110
> 
> Start from maxdevs instead: no address is assigned before ENTDAA runs,
> and the existing rx_count >= maxdevs check then reports an empty bus.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Tommaso Merciai<tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
