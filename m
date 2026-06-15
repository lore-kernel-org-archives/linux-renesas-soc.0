Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E457381B00;
	Mon, 15 Jun 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516232; cv=none; b=ZdvLObUJ7MzuaSGgEgtStm4UIGpzbmzvwnEE5g+LYUI5NmvGqOw3cbuvjc2JTBBRXQ/jfGRSCjAWFifw24ytRrlij8+kpupBB2bzKEc1UeAUCT1JEQzKsjB/Zm/4JeVX8/R7vZQAW03Amu7HnSeoriPOBB8Nh0Prhu9HkLehjVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516232; c=relaxed/simple;
	bh=oyiD+IluX/EvYo9gY1mrrgs7KrDHRfRfSr0Ms4A+4Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hk6L44BR9gnQF22PcFRc1/4hE2WfKO5PACV/9w6Pnbal/9Ef6uGp/gkdA5S3lvqWRNNHGLYyFOdSg2TCW7eA/vZwzy3sDXF2DWyZrR0Sbqb7BQzkzpkYlMxVzwcrfm7YoFjkKqiIBAED7cNk2ItGhGpniuAGABjr5ea2At4e+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD2E1F000E9;
	Mon, 15 Jun 2026 09:37:07 +0000 (UTC)
Message-ID: <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
Date: Mon, 15 Jun 2026 12:37:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
To: Biju <biju.das.au@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 6/12/26 17:30, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> devm_regulator_get_exclusive() initialises the regulator with
> enable_count = 1, requiring the consumer to disable it before release.
> 
> Previously, the devm disable action was only registered when the
> regulator was explicitly enabled, causing the cleanup path to skip
> decrementing enable_count on device removal when the regulator was
> left disabled.
> 
> Fix this by always registering the devm disable action when the regulator
> is enabled (checked via regulator_is_enabled()), covering both the
> explicitly-enabled case and the initial state set by
> devm_regulator_get_exclusive().
> 
> This fixes WARN_ON enable count during regulator release.
> 
> Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The approach in this patch don't solve the problem, at least on RZ/G3S. See [1] 
for logs.

I applied this patch on next-20260610:

git log --oneline -2
afe09f11d549 (HEAD) phy: renesas: phy-rcar-gen3-usb2: Fix devm action 
registration for disabled VBUS regulator
abe651837cb3 (tag: next-20260610, linux-next/master) Add linux-next specific 
files for 20260610

[1] 
https://github.com/claudiubeznea/logs/blob/2f1bab20407dfe6031385819ffeabfc4eac772bd/logs
