Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33395 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945AbcHQJAk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 05:00:40 -0400
Received: by mail-it0-f68.google.com with SMTP id d65so8312326ith.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Aug 2016 02:00:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160817071335.GG8673@verge.net.au>
References: <1470993535-11795-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20160817071335.GG8673@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2016 11:00:38 +0200
Message-ID: <CAMuHMdV_xp1ApMy6XrQtv5oaJMewiCttaQHZLvH5E_i9F6A9kQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-x: Configure pins for the
 DU RGB output
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Aug 17, 2016 at 9:13 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Aug 12, 2016 at 12:18:55PM +0300, Laurent Pinchart wrote:
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> This patch depends on "[PATCH] pinctrl: sh-pfc: r8a7795: Add DU support"
>> posted a few minutes ago to the linux-renesas-soc mailing list, as well as on
>> the "[PATCH v2 0/4] R-Car Gen3 DU enablement on Salvator-X board" series
>> posted yesterday to the same list.
>>
>> As the boot loader configures the DU pins on Salvator-X we can safely delay
>> this patch by one kernel version to let the pinctrl dependency hit mainling
>> first.
>
> I'm not entirely sure it is necessary to defer this patch by a kernel
> release but if that is your wish then I'm happy to do so. If so
> please repost at the appropriate time.

I believe applying this patch now means that the DU won't work in your
renesas-devel tree (unless you merge sh-pfc-for-v4.9).
Of course it should work in renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
