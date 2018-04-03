Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:35975 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeDCQkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Apr 2018 12:40:43 -0400
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
To: Wolfram Sang <wsa@the-dreams.de>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180403155524.f7bjynyrr2uaxbvb@ninjato>
CC: <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <a3d7b5d2-3a1c-7bc6-dc5c-4dc4d658ba40@mentor.com>
Date: Tue, 3 Apr 2018 19:40:37 +0300
MIME-Version: 1.0
In-Reply-To: <20180403155524.f7bjynyrr2uaxbvb@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 04/03/2018 06:55 PM, Wolfram Sang wrote:
> Hi Vladimir and Eugeniu,
> 
>> The purpose of this patch looks pretty similar to:
>> 104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
>> 74f56c4ad4e4 ("i2c-bfin-twi: move setup to the earlier subsys initcall")
>> b8680784875b ("i2c-gpio: Move initialization code to subsys_initcall()")
>> 5d3f33318a6c ("[PATCH] i2c-imx: make bus available early")
>> ccb3bc16b489 ("i2c-sh_mobile: change module_init() to subsys_initcall()")
>> 18dc83a6ea48 ("i2c: i2c-s3c2410: Initialise Samsung I2C controller early")
>> 2514cca06be9 ("[ARM] 5394/1: Add static bus numbering support to i2c-versatile")
>> 47a9b1379a5e ("i2c-pxa: Initialize early")
>>
>> However, the story behind it might be a bit different.
> 
> It definately is. The above drivers are very old, from the days where
> -EPROBE_DEFER was non-existant. They needed subsys_initcall to be able
> to boot. The reason they still have it is simple: reverting to
> module_initcall could cause regressions.
> 
> This patch is about boot-time. Very different.
> 
>> Experimenting with async probing in various rcar-specific drivers (e.g.
>> rcar-du, vsp1, rcar-fcp, rcar-vin), it was noticed that in most of
>> the cases enabling async probing in one driver introduced some degree of
>> inconsistency in the initialization of other builtin drivers.
> 
> I have to admit I never played with async probing...
> 
>> To give an example, with pure sequential driver initialization, based
>> on 5 dmesg logs, the builtin kernel initialization deviation is
>> around +/- 5ms, whereas after enabling async probing in e.g. vsp1
>> driver, the variance is increased to sometimes +/- 80ms or more.
> 
> ... so I can't tell if there is something which can be fixed on the
> async probe side. I would naively think so.
> 
>> This patch fixes it and keeps the startup time consistent after
>> switching certain i2c-dependent drivers to asynchronous probing on
>> H3-es20-Salvator-X target.
> 
> I am not convinced "fix" is the right word here. Why is it not just a
> workaround? Are there no other possibilities? I know other solutions are
> usually complicated, but playing with init levels is fragile and caused
> circular dependencies in the past, so I really don't like them.

in summary (and according to my understanding, Eugeniu please feel free
to correct me) the actual product boards have multitude of I2C devices
connected to the master controller. It requires to read EDID to enable
video output or init sensors to get video input and so on, and normally
device drivers of endpoint devices are executed on module_init() level.

Thus putting an I2C master controller device driver to the same late
init level means that due to the concurrency there will be lots of
probe defers of endpoint device drivers, and making "heavy" device
drivers like rcar-vin to be run in asyncronous probe increases boot
time dispersion (rcar-vin is already probed, it's time to probe a
sensor, but I2C controller is not yet ready to operate, defer).

I don't suppose that the proposed change has any single negative
side effect, well, right, probe/remove code becomes more awkward,
but in general the expected effect to boot time improvement should
cover it, I hope.

>> Another effect seems to be improving the init time of rcar_i2c_driver
>> itself from ~7ms to ~1ms (assuming CONFIG_I2C_RCAR=y).
> 
> That doesn't help the patch much ;), but still interesting because I didn't
> expect that. Do you have an idea why?
> 

--
With best wishes,
Vladimir
