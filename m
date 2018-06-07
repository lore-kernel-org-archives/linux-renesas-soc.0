Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39370 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751037AbeFGNTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 09:19:50 -0400
Subject: Re: [PATCH v5 01/14] mfd: da9063: Replace regmap_add_irq_chip with
 devm counterpart
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <019675f0-13ff-d381-87d1-891316cbfd83@gmail.com>
 <20180607124159.GD22841@dell>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d62db199-0255-fcde-1de0-5d335d596dc1@gmail.com>
Date: Thu, 7 Jun 2018 15:19:33 +0200
MIME-Version: 1.0
In-Reply-To: <20180607124159.GD22841@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/07/2018 02:41 PM, Lee Jones wrote:
> On Thu, 07 Jun 2018, Marek Vasut wrote:
> 
>> On 06/06/2018 11:59 AM, Marek Vasut wrote:
>>> Use devm_regmap_add_irq_chip() instead of plain regmap_add_irq_chip(),
>>> which removes the need for da9063_irq_exit() altogether and also
>>> fixes a bug in da9063_device_init() where the da9063_irq_exit() was
>>> not called in a failpath.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Cc: linux-renesas-soc@vger.kernel.org
>>
>> So it's just this one patch that's missing AB/RB and the series should
>> be good?
> 
> Looks fine. Although we'll let it sit for a while in case anyone else
> has any thoughts.

Fine by me.

> The merge window is currently open, so there is no rush to apply.

This is still 4.18 material ? Hum, OK.

>>> ---
>>> V5: New patch
>>> ---
>>>  drivers/mfd/da9063-core.c       | 1 -
>>>  drivers/mfd/da9063-irq.c        | 8 ++------
>>>  include/linux/mfd/da9063/core.h | 1 -
>>>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Added to my tree.

-- 
Best regards,
Marek Vasut
