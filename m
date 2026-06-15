Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4191E3E2AC8;
	Mon, 15 Jun 2026 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523860; cv=none; b=ITg9EpvBY6v8Pgl6hmlaGXRqqR9w6eEuNKZ6HOWrxMfQR2V2gpHtCSN3BViHJTDI9d1h1HhZVCttxRpnSeBEXeexpD4sk9rk6wUI7JRl6nxXP7PfWyrIL7L1UDQ3onx28jx051//5Ep9xTp9es1IKjVxyOgeP3I3IThqXh2kYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523860; c=relaxed/simple;
	bh=Vnr2M6fiNlCUGcfBAZuoBrlK30VsmVCRno0KHrkkK0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1ep4V0rFsZPjn/hRiqP2W232XFYp1PLUh3OHUVAD6Gyzo1cORdwGWm1MzKXI9TG3AL/r7VKz/czIjYOc6+RyDjVhXmevqu4Hnll7GYSlHcgydHk0HlVIUY3OuHPnrR2oxJEWJrNIxIEkAw8J55wGp4+khrLmCQ4xqGXwTMczug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7385B1F000E9;
	Mon, 15 Jun 2026 11:44:15 +0000 (UTC)
Message-ID: <75976eb6-5837-4229-9faa-c77e058d1cba@tuxon.dev>
Date: Mon, 15 Jun 2026 14:44:13 +0300
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
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/15/26 13:22, Biju Das wrote:
> Hi Claudiu,
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
> I have tested only with RZ/G3L host and I don't see the issue.
> How can the issue be reproduced? It could be related to RZ/G3S.

It's reproducible with this patch on G2L as well, please see 
https://github.com/claudiubeznea/logs/blob/0601044903b5ae714592db9770bc4ed31fd8bf84/logs.

> I have executed the following tests and don't see any issue.
> Can you please try the same tests on RZ/G3S?

Try stressing it a bit, e.g. the following command trigger it on both G3S and G2L:

cnt=300; while [ $cnt -ge 0 ]; do echo 11c40000.usbphy-ctrl > unbind ; echo 
11c40000.usbphy-ctrl > bind ; cnt=$((cnt-1)); done

Same command could be executed for other USB drivers.

> Is unbind/bind ever worked on RZ?G3S previously?

In the same way it works on G2L: functionality is OK, these stack traces are 
displayed as on any other RZ/G2L based SoCs.

Thank you,
Claudiu

