Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34713 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757417AbcFAH1s (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:27:48 -0400
Received: by mail-io0-f195.google.com with SMTP id l9so1884755ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 00:27:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <426527f7-d1fe-8574-7f25-66298bb55eab@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
	<c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
	<CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
	<eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
	<CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
	<426527f7-d1fe-8574-7f25-66298bb55eab@de.bosch.com>
Date: Wed, 1 Jun 2016 09:27:47 +0200
Message-ID: <CAMuHMdVFZcb0VnM6E971q08c5qzJn2+dOhqv9VL9zvb0T9ocAQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Jun 1, 2016 at 9:19 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 01.06.2016 07:19, Magnus Damm wrote:
>> On Fri, May 27, 2016 at 4:56 PM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> On 27.05.2016 05:13, Magnus Damm wrote:
>>>> I don't think anyone disagrees that it makes sense to be able to
>>>> determine ES version during runtime. The questions in my mind are how
>>>> to do it
>>>
>>> I've made a proposal ;) And I'm happy to discuss technically about it.
>>
>> Thanks! It would be interesting to know the reason behind your
>> interest in these things. For instance, if you are interested in
>> reducing run time memory usage, or general source code duplication
>> reduction. Do you have any target platform that you can upstream board
>> support for?
>>
>>>> and the urgency.
>>>
>>> Regarding the urgency: Someone has accepted the hard coded PRODUCT
>>> register
>>> (and MODEMR) being in renesas-drivers, now:
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest#n177
>>>
>>> This does really hurts us.
>>>
>>> Therefore, I try to get this removed as soon as possible to hopefully get
>>> a
>>> Renesas BSP without this, the next time.
>>>
>>> If anybody finds an other way to remove that, that would be fine, too.
>>
>> Please share the underlying issue so we can fix that.
>>
>>>> So far we have decided to use the compatible string since it is a
>>>> common driver model abstraction already used by device drivers and
>>>> hardware description in DT. Using DT compat string matching we can
>>>> have logic in the drivers to handle ES differences if needed. As for
>>>> how to enable the workaround, my opinion is that the missing piece
>>>> consists of ES workaround code that appends ES suffix information to
>>>> the DT compat strings automatically during boot.
>>>
>>> Technically this sounds slightly too complicated to me. As I have to
>>> advocate my proposal (inspired from an other mainline SoC family) I'd
>>> think
>>> that my proposal is easier.
>>
>> It may indeed be easier in the short term, but I feel we need to
>> consider how to support a wide range of SoCs in a consistent way.
>>
>>>> I suppose the workaround is not yet implemented because no one has
>>>> deemed this topic as particularly urgent. Until it becomes urgent or a
>>>> new ES version appears the affected users can simply adjust the DT
>>>> binding themselves. This is what happened to the "sata-r8a7790-es1"
>>>> case above.
>>
>> Can you see any technical reason why using DT compat strings wouldn't
>> solve your case?
>
> I'll try to explain my understanding. Please re-ask or correct me if I fail
> ;)
>
> First of all, I can talk only about R-Car3. There, at the moment, we have
> ES1, ES2 and ES3 documented, already. We don't know, yet, if these are
> really needed in the code, but it might be.
>
> Taking the example above, we then would have
>
> compatible = "renesas,sata-r8a7790", "sata-r8a7790-es1", "sata-r8a7790-es2",
> "sata-r8a7790-es3";
>
> in the device tree. Do we want that? No! Because its no run time detection.

You would only have "renesas,sata-r8a7790" for normal parts.
ES1 needs "renesas,sata-r8a7790-es1".
"esX" compatible values are the exception, not the rule.

> If we don't want that, and we want runtime detection, I think anywhere in
> this thread it was mentioned that the "es1" string is appended to
> sata-r8a7790 at runtime? If so, could you point us to the code for that?

The PoC is on my local SSD. Will send out soon.

> Then we have anything like
>
> if(PRODUCT_REG & ES1 == ES1)
>         append ES1 to the compatible string
>
> in the boot code. This is one additional indirection to my proposal, needing
> boot time. In the driver you then add
>
>         {
>                 .compatible = "renesas,sata-r8a7790-es1",
>                 .data = (void *)RCAR_R8A7790_ES1_SATA
>         },
>         {
>                 .compatible = "renesas,sata-r8a7790-es2",
>                 .data = (void *)RCAR_R8A7790_ES2_SATA
>         },
>         {
>                 .compatible = "renesas,sata-r8a7790-es3",
>                 .data = (void *)RCAR_R8A7790_ES3_SATA
>         },

No, only "renesas,sata-r8a7790" and "renesas,sata-r8a7790-es1", like we
already have.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
