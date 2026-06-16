Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1450440E8D7;
	Tue, 16 Jun 2026 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598499; cv=none; b=ptgA6q9a444yD87lkKLT2ZcF4epxmqRwA1bF6moGujwHtJgCq89GNw9nx26WPl3H8Uasphma2A3LRQ9vXadE7B0qDnJQJHqOlO0htLYBzpJnTs9a/HNd6uDjsocRrd4IeX+NXYuwSJjALLL2mfM8+opLvkxbW4J/0u0tnRY3Cdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598499; c=relaxed/simple;
	bh=Gt+Qq/1jc82hQ3LN4r1D8eHwFQmZjQsdwnbDL1mC4gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OczAf7W70OAste0n3z2v1VWT/u+PHZTcdEyumlPva9acwfnjC9n3RP6dRPpVfBcKAVxjWjhpBmFHQdkkyHkHSP1Z1+0IWWBCzHk8xDzCBmwJaTSwBLQWm6gVn3rsHk0jcI353I3wJsdTi3KlpoOtkDLmhkV5qil0IkqqP/NI03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506F51F00A3A;
	Tue, 16 Jun 2026 08:28:14 +0000 (UTC)
Message-ID: <c49cce1a-5de3-4741-b49a-0fdef9dce9e5@tuxon.dev>
Date: Tue, 16 Jun 2026 11:28:12 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 stable <stable@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
 <TY3PR01MB113460C85EEF713331411FBEC86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113460C85EEF713331411FBEC86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 6/15/26 15:42, Biju Das wrote:
> Hi Claudiu,
> 
> + stable <stable@kernel.org>
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 15 June 2026 10:37
>> Subject: Re: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled
>> VBUS regulator
>>
>> Hi, Biju,
>>
>> On 6/12/26 17:30, Biju wrote:
>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>
>>> devm_regulator_get_exclusive() initialises the regulator with
>>> enable_count = 1, requiring the consumer to disable it before release.
>>>
>>> Previously, the devm disable action was only registered when the
>>> regulator was explicitly enabled, causing the cleanup path to skip
>>> decrementing enable_count on device removal when the regulator was
>>> left disabled.
>>>
>>> Fix this by always registering the devm disable action when the
>>> regulator is enabled (checked via regulator_is_enabled()), covering
>>> both the explicitly-enabled case and the initial state set by
>>> devm_regulator_get_exclusive().
>>>
>>> This fixes WARN_ON enable count during regulator release.
>>>
>>> Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS
>>> for RZ/G2L SoCs")
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>
>> The approach in this patch don't solve the problem, at least on RZ/G3S. See [1] for logs.
>>
>> I applied this patch on next-20260610:
>>
>> git log --oneline -2
>> afe09f11d549 (HEAD) phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS
>> regulator
>> abe651837cb3 (tag: next-20260610, linux-next/master) Add linux-next specific files for 20260610
>>
>> [1]
>> https://github.com/claudiubeznea/logs/blob/2f1bab20407dfe6031385819ffeabfc4eac772bd/logs
> 
> This issue is introduced by the commit
> 
> eb9ac779830b223584 ("usb: renesas_usbhs: Fix synchronous external abort on unbind")

Indeed, nice catch. I reverted this commit (just for checking the patch you 
proposed) and and now it looks good on RZ/G2L. Code from commit eb9ac779830b 
("usb: renesas_usbhs: Fix synchronous external abort on unbind") will have to be 
adjusted.

Thank you for investigation,
Claudiu
