Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34477 "EHLO
	mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757223AbcFACdz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 22:33:55 -0400
Received: by mail-vk0-f66.google.com with SMTP id a6so975527vkg.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 19:33:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ea63f4b2-7ee8-dc9b-dd0c-bd68de8a57bd@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<1464166708-18320-5-git-send-email-dirk.behme@de.bosch.com>
	<CANqRtoSAFMnKvjqaH2fB=W260LJqG7v5babhanCJw0Zx_+Okjw@mail.gmail.com>
	<6941ed0e-9ccb-1c3b-d8cd-0b2365add037@de.bosch.com>
	<CANqRtoTUz0wVDHziUoQsJ-=pbLYfsiQoF8b5ovi1KBq+eRLX2Q@mail.gmail.com>
	<ea63f4b2-7ee8-dc9b-dd0c-bd68de8a57bd@de.bosch.com>
Date: Wed, 1 Jun 2016 11:33:54 +0900
Message-ID: <CANqRtoRmk2OrO_69ATuTQNQKE2RatOR352LWjPuTGzqugqbXkA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Use product register framework
From: Magnus Damm <magnus.damm@gmail.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Fri, May 27, 2016 at 7:18 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Hi Magnus,
>
>
> On 27.05.2016 11:56, Magnus Damm wrote:
>>
>> Hi Dirk,
>>
>> On Fri, May 27, 2016 at 5:16 PM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>>
>>> Hi Magnus,
>>>
>>>
>>> On 27.05.2016 05:40, Magnus Damm wrote:
>>>>
>>>>
>>>> Hi Dirk,
>>>>
>>>> On Wed, May 25, 2016 at 5:58 PM, Dirk Behme <dirk.behme@de.bosch.com>
>>>> wrote:
>>>>>
>>>>>
>>>>> Instead of hard coding the product register in the rcar-du, use
>>>>> the framework for it to get the SoC version and the revision needed
>>>>> for the enabling the workaround.
>>>>>
>>>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>>> ---
>>>>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 13 ++-----------
>>>>>  1 file changed, 2 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> index e10943b..ee639a6 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> @@ -13,6 +13,7 @@
>>>>>
>>>>>  #include <linux/clk.h>
>>>>>  #include <linux/mutex.h>
>>>>> +#include <linux/soc/renesas/rcar3-prr.h>
>>>>>
>>>>>  #include <drm/drmP.h>
>>>>>  #include <drm/drm_atomic.h>
>>>>> @@ -30,12 +31,6 @@
>>>>>  #include "rcar_du_regs.h"
>>>>>  #include "rcar_du_vsp.h"
>>>>>
>>>>> -#define PRODUCT_REG    0xfff00044
>>>>> -#define PRODUCT_H3_BIT (0x4f << 8)
>>>>> -#define PRODUCT_MASK   (0x7f << 8)
>>>>> -#define CUT_ES1                (0x00)
>>>>> -#define CUT_ES1_MASK   (0x000000ff)
>>>>> -
>>>>>  static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>>>>>  {
>>>>>         struct rcar_du_device *rcdu = rcrtc->group->dev;
>>>>> @@ -167,7 +162,6 @@ static void rcar_du_crtc_set_display_timing(struct
>>>>> rcar_du_crtc *rcrtc)
>>>>>         u32 div;
>>>>>         u32 dpll_reg = 0;
>>>>>         struct dpll_info *dpll;
>>>>> -       void __iomem *product_reg;
>>>>>         bool h3_es1_workaround = false;
>>>>>
>>>>>         dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
>>>>> @@ -175,11 +169,8 @@ static void rcar_du_crtc_set_display_timing(struct
>>>>> rcar_du_crtc *rcrtc)
>>>>>                 return;
>>>>>
>>>>>         /* DU2 DPLL Clock Select bit workaround in R-Car H3(ES1.0) */
>>>>> -       product_reg = ioremap(PRODUCT_REG, 0x04);
>>>>> -       if (((readl(product_reg) & PRODUCT_MASK) == PRODUCT_H3_BIT)
>>>>> -               && ((readl(product_reg) & CUT_ES1_MASK) == CUT_ES1))
>>>>> +       if (cpu_is_rcar3_h3() && revision_is_rcar3_es1())
>>>>>                 h3_es1_workaround = true;
>>>>> -       iounmap(product_reg);
>>>>
>>>>
>>>>
>>>> Thanks for your efforts!
>>>>
>>>> I agree that doing ioremap() with a hard coded address and reading out
>>>> an unrelated register looks like a short term workaround. Replacing
>>>> that with something cleaner makes sense. The question in my mind is
>>>> how to make it cleaner.
>>>>
>>>> I can see that in this series you have introduced some specialized
>>>> functions to be able to check ES version. This may be slightly
>>>> cleaner, but the design comes with some drawbacks. One major drawback
>>>> is that specialized functions makes it difficult to move the code
>>>> between several architectures. So if we should clean up the code then
>>>> we should go all the way and do it in a reusable way.
>>>>
>>>> Over the years many drivers have been initially written on the SH
>>>> arch, then moved to 32-bit ARM and recently also be used for ARM v8.
>>>> Not sure about the DU driver, it may only be shared between 32-bit ARM
>>>> and 64-bit ARM instead of all 3 architectures. I think the SCIF driver
>>>> has been used on even more architectures like H8. One major reason why
>>>> we have been able to reuse code over several architectures is that
>>>> we've focus on using standard functions and stayed away from
>>>> architecture-specific extensions. In case a short term workaround is
>>>> needed then it should not break the code on other architectures. The
>>>> initial short term code above would work on any of the supported SoCs
>>>> and it would also compile on a whole bunch of other architectures for
>>>> compile testing purpose.
>>>
>>>
>>>
>>>
>>> Please correct me if I'm wrong, but the initial short term code does work
>>> on
>>> all SoCs having a PRODUCT_REG @ 0xfff00044. Correct?
>>>
>>> And my code should work identically, no?
>>>
>>> Or where do you see the difference?
>>>
>>> Going even one step further, running the initial short term code on SoCs
>>> *not* having a PRODUCT_REG @ 0xfff00044 will fail randomly, depending on
>>> the
>>> result read from that address, then.
>>>
>>> Instead, my proposal, will give at least a valid error message (assuming
>>> the
>>> device tree entries are set correctly).
>>
>>
>> Your code is an improvement to the original one for sure, and I think
>> it should work identically but with better error reporting...
>>
>>> Regarding compilation, you are correct. Most probably I should add some
>>> empty stub functions for the cpu_is_xx() and revision_is_xx() functions
>>> used
>>> on unsupported platforms in a v2.
>>
>>
>> .. however adding a specialized API like this seems like the wrong
>> direction IMO. As you probably know, the hardware IP included in SoCs
>> come from various vendors with potentially shared device drivers.
>> Think USB host controller drivers or serial ports for instance. With
>> your approach you would potentially force shared drivers to include
>> <linux/soc/renesas/rcar3-prr.h> and similar per-SoC-vendor includes
>> just to be able to check version of a specific IP. This does not scale
>> very well IMO.
>
>
>
> If a specific IP on a specific SoC needs a SoC specific (revision-) check, I
> have difficulties to imagine how this could look like better.
>
> You won't put Renesas specific registers/functions/macros in e.g.
>
> <linux/soc-revision.h>
>
> No?

I prefer not to.

> What you could do is create a
>
> <linux/soc-revision.h>
>
> include this in your source code, and this <linux/soc-revision.h> includes
> the <linux/soc/renesas/rcar3-prr.h> based on some #ifdef. Hmm, would that be
> better?

Hm.. I think this smells similar to including architecture-specific
headers from <asm/...> (or <mach/..> on 32-bit ARM) like many drivers
at least used to do. Instead of quickly sprinkling if statements for
various SoCs and their revisions I think we should break out the
workarounds needed in each driver and assign them a feature flag. Then
associate the SoC-specific DT compat string with the feature flag. Of
course the DT compat strings for various ES versions need to be
documented as well.

>> Because of this I prefer to go with some kind of shared standard API
>> instead of per-vendor solutions.
>
>
>
> Any proposals?

Like mentioned earlier I believe we can reuse DT compat strings for
this purpose.

> Several SoCs seem to do this cpu_is_xxx() stuff in mainline.

Most drivers used to include stuff from <asm/> or <mach/> as well, but
that got reworked into something more sane when the drivers needed to
support more than one architecture.

In my mind the interesting questions are why they need to use such
checks and clarifying the reasons behind cpu_is_xxx() functions were
selected in the first place. They just look like the easy way out.

Normally drivers that need to support many kinds of similar but
slightly different hardware already have some detection method and/or
feature flags or whatnot to support a wide range of hardware. Look at
the 8250 driver files as one example.

>>>> Anyway, please use something standard that can be used on several
>>>> architectures without causing breakage. You should also discuss this
>>>> with the initial author of the DU driver. He may have a different
>>>> opinion than me, but I'm sure he agrees on that the driver should keep
>>>> on working on several architectures.
>>>
>>>
>>> I agree here and I'm happy do discuss this. I tried this with adding Koji
>>> Matsuoka into all discussions CC. Do you like to propose anybody else?
>>
>>
>> I suspect Matsuoka-san wrote this code with the BSP target in mind.
>> Then this was broken out into a series when trying to enable HDMI
>> support on top of mainline. Like Geert wrote in his email, the code
>> seems a bit immature at this point. So simply dropping the HDMI series
>> for now makes sense to me.
>
> This does help for the issue with the hard coded PRODUCT register for the
> moment. But please note that it don't solve the problem in long term. Once
> the code should be put back, you'll need that revision check, again. Just
> because there is different hardware out there.

Can you please explain what the problem is with the hard coded PRODUCT
register access? Of course it is not pretty, but does it break
anything? In my mind the code is dirty but does not cause any issue.
If something is broken please share a link to an email where this has
been reported.

It seems to me that certain renesas-drivers releases contain more
experimental code than others. It is common that code from linux-next
is included as well as experimental driver features. And to make it
more interesting, I suspect the commit that is adding that hard coded
PRODUCT register access is actually coming from the Renesas BSP
initially.

So it seems to me that R-Car Gen3 on-chip HDMI support needs more
effort before upstream merge is possible. This additional effort would
include cleaning up that PRODUCT register access bits. Whatever code
that ended up in some renesas-drivers release (and perhaps the BSP) is
simply some early stage prototype code.

Thanks,

/ magnus
