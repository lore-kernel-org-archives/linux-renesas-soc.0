Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:33501 "EHLO
	mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932168AbcE0DND (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 23:13:03 -0400
Received: by mail-vk0-f50.google.com with SMTP id r140so127625121vkf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 May 2016 20:13:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
	<c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
Date: Fri, 27 May 2016 12:13:01 +0900
Message-ID: <CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
From: Magnus Damm <magnus.damm@gmail.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Thu, May 26, 2016 at 4:48 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Hi Geert,
>
> On 26.05.2016 09:14, Geert Uytterhoeven wrote:
>>
>> Hi Dirk,
>>
>> On Wed, May 25, 2016 at 10:58 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>>
>>> Instead of hard coding the product register in rcar_du_crtc.c,
>>> read it based on the device tree.
>>>
>>> This patch series is based on
>>>
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
>>> renesas-drivers-2016-05-17-v4.6
>>> 4717ef6d59c3204e385c
>>> Revert "ASoC: simple-card: Add pm callbacks to platform driver"
>>>
>>> It's boot tested on r8a7795 Salvator-X and checked that the same
>>> product register value is read without and with this patch series.
>>
>>
>> Thanks for your series!
>>
>> Given the use of PRR you saw is in a patch that's definitely not ready for
>> upstream, I think adding a full-fledged PRR driver is a bit premature.
>>
>> So far we've always planned to handle differences in ES versions using the
>> compatible value, cfr. "renesas,sata-r8a7790-es1".
>> But in general we target the latest (production) version in upstream.
>
> Well, there are several issues ;)
>
> First, regarding "handle differences in ES versions using the compatible
> value, cfr. "renesas,sata-r8a7790-es1": I can't talk about r8a7790. But for
> r8a7795 & r8a7796 we are able to auto-detect this by the PRR. And I'd think
> what can be auto detected, should be auto detected. And not handled via the
> device tree.
>
> Second: Other SoCs families show us that we definitely need such kind of
> cpu_is() and revision_is() logic.

I don't think anyone disagrees that it makes sense to be able to
determine ES version during runtime. The questions in my mind are how
to do it and the urgency.

So far we have decided to use the compatible string since it is a
common driver model abstraction already used by device drivers and
hardware description in DT. Using DT compat string matching we can
have logic in the drivers to handle ES differences if needed. As for
how to enable the workaround, my opinion is that the missing piece
consists of ES workaround code that appends ES suffix information to
the DT compat strings automatically during boot.

I suppose the workaround is not yet implemented because no one has
deemed this topic as particularly urgent. Until it becomes urgent or a
new ES version appears the affected users can simply adjust the DT
binding themselves. This is what happened to the "sata-r8a7790-es1"
case above.

Thanks,

/ magnus
