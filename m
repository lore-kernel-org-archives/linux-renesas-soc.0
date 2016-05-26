Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:44970 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbcEZHsn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 03:48:43 -0400
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
Date: Thu, 26 May 2016 09:48:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 26.05.2016 09:14, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Wed, May 25, 2016 at 10:58 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> Instead of hard coding the product register in rcar_du_crtc.c,
>> read it based on the device tree.
>>
>> This patch series is based on
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
>> renesas-drivers-2016-05-17-v4.6
>> 4717ef6d59c3204e385c
>> Revert "ASoC: simple-card: Add pm callbacks to platform driver"
>>
>> It's boot tested on r8a7795 Salvator-X and checked that the same
>> product register value is read without and with this patch series.
>
> Thanks for your series!
>
> Given the use of PRR you saw is in a patch that's definitely not ready for
> upstream, I think adding a full-fledged PRR driver is a bit premature.
>
> So far we've always planned to handle differences in ES versions using the
> compatible value, cfr. "renesas,sata-r8a7790-es1".
> But in general we target the latest (production) version in upstream.


Well, there are several issues ;)


First, regarding "handle differences in ES versions using the compatible 
value, cfr. "renesas,sata-r8a7790-es1": I can't talk about r8a7790. But 
for r8a7795 & r8a7796 we are able to auto-detect this by the PRR. And 
I'd think what can be auto detected, should be auto detected. And not 
handled via the device tree.


Second: Other SoCs families show us that we definitely need such kind of 
cpu_is() and revision_is() logic.


Third: Regarding "But in general we target the latest (production) 
version in upstream": Please keep in mind how Renesas is doing their 
BSPs. For the Renesas BSPs, Renesas picks your renesas-drivers (and not 
upstream!). I.e. what ever is in your renesas-drivers might end up in a 
customer BSP. And this is what really hurts us (as a customer) here.

Now, we have a Renesas BSP, based on your renesas-drivers, which has a 
hard coded MODEMR and PRODUCT_REG (and I think ADVFS, but that seems to 
be from Renesas and not from renesas-drivers). And this really hurts us. 
Therefore I try to fix this in your renesas-drivers, to hopefully have 
it fixed in the next Renesas BSP. *And* discuss with the community how 
to further improve it.

I.e. in a frist step, I'm mainly thinking about getting renesas-drivers 
"fixed" and with this the next Renesas BSP.

Best regards

Dirk
