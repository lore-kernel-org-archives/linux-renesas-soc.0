Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34201 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbcEIHyS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:54:18 -0400
Received: by mail-ig0-f194.google.com with SMTP id kj7so10667645igb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:54:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c75e9eda-642d-c1f8-5a10-68e27aa49ae3@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
	<1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWHmu0WQSeU8oHwUhm20ZGqzmLGXG1tz8suuGqY=b49Vg@mail.gmail.com>
	<c75e9eda-642d-c1f8-5a10-68e27aa49ae3@de.bosch.com>
Date: Mon, 9 May 2016 09:54:17 +0200
Message-ID: <CAMuHMdVr8r5D72BiF6__gfZOJkNxmPcykB0pNeJq7zcdsVpN-A@mail.gmail.com>
Subject: Re: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Mon, May 9, 2016 at 9:52 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 09.05.2016 09:44, Geert Uytterhoeven wrote:
>>
>> On Mon, May 9, 2016 at 9:14 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>>
>>> --- a/arch/arm/boot/dts/r8a7790.dtsi
>>> +++ b/arch/arm/boot/dts/r8a7790.dtsi
>>> @@ -1102,6 +1102,11 @@
>>>                         #power-domain-cells = <0>;
>>>                 };
>>>
>>> +               modemr: modemr@e6160060 {
>>> +                       compatible = "renesas,modemr";
>>> +                       reg = <0 0xe6160060 0 0x4>;
>>> +               };
>>> +
>>
>>
>> This should be a node for the complete RST module, not just for the RST
>> module's
>> MODEMR register.
>
>
>
> You mean
>
> reset: reset@e6160000 {
>         compatible = "renesas,reset";
>         reg = <0 0xe6160000 0 0x200>;
> };
>
> and then use anything like
>
> #define MODEMR 0x60
>
> in the code?

Yes, more or less:

        reset-controller@e6160000 {
                compatible = "renesas,r8a7795-rst";
                reg = <0 0xe6160000 0 0x0200>;
        };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
