Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679B5C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30D4C2087E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfA1PPm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 10:15:42 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33208 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfA1PPm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 10:15:42 -0500
Received: by mail-vs1-f66.google.com with SMTP id p74so9952345vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 07:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uc6WoO2z+zsVLDXH5Em8MO6e3XxGu77yxdM3mgUPFZI=;
        b=d59BPNkqUuCydo4L2hbZorMny9OYJ0QI2ToSeH+1ZEZDGi6bBUiX/rerZE16WXUh2m
         S4e1XbbJCQ+2/GSs3KGW1H20ukupd0zQ0PCa3gusAg9IOyF7llR6xOtiUZHC7au0IL8C
         GlioihIqMbWY2PQdWMuywFuT9OAihef/WFub7KjGctkoA2S8aUuf3utcWeX3PbYh/cuC
         ctpiqaAWxOpFXBt+nk3aPK4BQOqEn2JENUW1eF4lplbHzXpWp8xK4FCL9PvE+lerbOSV
         jHuR3hsO25hnDrrg74CmriQFxV9lTUzTsIxb1OiHRmbsyezsyMNqrEwJc8S/q+HRAGiJ
         iG6w==
X-Gm-Message-State: AJcUukcSrUOagUpzXuLin9WWBInptNPV2dLZV4uGzO30ncIFUByUuxV3
        FC6dTOa3/Z4Meq/bwG2Kth683z7fVX4xpMyMkqE=
X-Google-Smtp-Source: ALg8bN6d9uiiQyk9jw6ePJt5Y/NpGdb12sk10RzXY3+u9ucnmZLkdbQ16LGJz14eLM7aKoce7NemZL0WK22duM8doG8=
X-Received: by 2002:a67:f43:: with SMTP id 64mr9127438vsp.166.1548688541740;
 Mon, 28 Jan 2019 07:15:41 -0800 (PST)
MIME-Version: 1.0
References: <1547553762-4467-1-git-send-email-ykaneko0929@gmail.com> <20190128140519.wfbnpgznbkx3msft@verge.net.au>
In-Reply-To: <20190128140519.wfbnpgznbkx3msft@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jan 2019 16:15:30 +0100
Message-ID: <CAMuHMdW2j4e4yc2ZkeJ71uqGz7FS2Kb2141tyZp9y3zTrJ21_g@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jan 28, 2019 at 3:05 PM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jan 15, 2019 at 09:02:42PM +0900, Yoshihiro Kaneko wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch define OOP tables for all CPUs.
> > This allows CPUFreq to function.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
>
> Thanks, I have tested CPUFreq with this tested that with this patch and
> "[PATCH] clk: renesas: r8a77990: Add Z2 clock"
> (https://patchwork.kernel.org/patch/10783723/) applied on top of
> renesas-devel-20190128-v5.0-rc4.
>
> Geert, or others, is it expected that z2 does not scale
> in this test?

Given your patch adds the Z2 clock as a fixed clock, this is expected ;-)

Note that the BSP adds this clock as a programmable clock of type
CLK_TYPE_GEN3_Z2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
