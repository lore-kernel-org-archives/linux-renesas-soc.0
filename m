Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:35964 "EHLO
	mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750697AbcFAFTi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 01:19:38 -0400
Received: by mail-vk0-f68.google.com with SMTP id c189so1386359vkb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 22:19:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
	<c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
	<CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
	<eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
Date: Wed, 1 Jun 2016 14:19:36 +0900
Message-ID: <CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
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

On Fri, May 27, 2016 at 4:56 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 27.05.2016 05:13, Magnus Damm wrote:
>> I don't think anyone disagrees that it makes sense to be able to
>> determine ES version during runtime. The questions in my mind are how
>> to do it
>
>
>
> I've made a proposal ;) And I'm happy to discuss technically about it.

Thanks! It would be interesting to know the reason behind your
interest in these things. For instance, if you are interested in
reducing run time memory usage, or general source code duplication
reduction. Do you have any target platform that you can upstream board
support for?

>> and the urgency.
>
>
>
> Regarding the urgency: Someone has accepted the hard coded PRODUCT register
> (and MODEMR) being in renesas-drivers, now:
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest#n177
>
> This does really hurts us.
>
> Therefore, I try to get this removed as soon as possible to hopefully get a
> Renesas BSP without this, the next time.
>
> If anybody finds an other way to remove that, that would be fine, too.

Please share the underlying issue so we can fix that.

>> So far we have decided to use the compatible string since it is a
>> common driver model abstraction already used by device drivers and
>> hardware description in DT. Using DT compat string matching we can
>> have logic in the drivers to handle ES differences if needed. As for
>> how to enable the workaround, my opinion is that the missing piece
>> consists of ES workaround code that appends ES suffix information to
>> the DT compat strings automatically during boot.
>
> Technically this sounds slightly too complicated to me. As I have to
> advocate my proposal (inspired from an other mainline SoC family) I'd think
> that my proposal is easier.

It may indeed be easier in the short term, but I feel we need to
consider how to support a wide range of SoCs in a consistent way.

>> I suppose the workaround is not yet implemented because no one has
>> deemed this topic as particularly urgent. Until it becomes urgent or a
>> new ES version appears the affected users can simply adjust the DT
>> binding themselves. This is what happened to the "sata-r8a7790-es1"
>> case above.

Can you see any technical reason why using DT compat strings wouldn't
solve your case?

Thanks,

/ magnus
