Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC957C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C579F20861
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfAVIZq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 03:25:46 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36926 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbfAVIZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 03:25:46 -0500
Received: by mail-vs1-f66.google.com with SMTP id n13so14226907vsk.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 00:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGyal59jfKp30RrP9BL3MHd18FnsPFo4l6O1GeXCIq8=;
        b=RXUwHE0XouAgl78AEl54yiS4Fs3GTpP99znIt+IxvvwcFtJ9sf33oVuwg1QyO/kGy2
         AXlQrDXOW1vz7jKqw2y2HjVS7TyObHzljIZPf2c8ouhZz6AuypyRxzNeOBYnktR2q4UV
         /JHMICYTsYXyHyTlAT8u+qFsMAobNLUC6Wz4T6PZcrig73voE/STSrtwo4j8E5J49qYk
         qLCk9QlZuYqenGvcguJjIFQ5fx74LhA4FRRruGRHcpMNzcBG7ZXKCLZxnMjEz1vB/gS9
         7SUdT3ACgv4ku7N2Tq525sk0d/WB7xp8iFdGOy7kb34sWC6hI55uxTdGudu3oWJwbuEE
         Ct5g==
X-Gm-Message-State: AJcUukcbLvOIYJNbbI0ykX8T65r6QcQPlVlgglVeCgcoc/GSScn68UKn
        enoFrK9FFB0zqXK8Q6jCtgMHkOnxRufO3uqxKqc=
X-Google-Smtp-Source: ALg8bN6YhawHudCm6F/ZdRFYEzIKR8e7cGFCRztjkd2dXkzrFm97O4ErANctsVhqDghE+HFX9cQW1xM1vnddndLprPw=
X-Received: by 2002:a67:c202:: with SMTP id i2mr13167796vsj.11.1548145545282;
 Tue, 22 Jan 2019 00:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20190118155938.12124-1-geert+renesas@glider.be> <20190121165600.2lavtrk2djj4adgb@verge.net.au>
In-Reply-To: <20190121165600.2lavtrk2djj4adgb@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 09:25:33 +0100
Message-ID: <CAMuHMdV-AM9GNnDo7W55Mv-uLtWn-nTBtmh3jn30tRSEDLNfTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.0-rc2
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jan 21, 2019 at 5:56 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 18, 2019 at 04:59:38PM +0100, Geert Uytterhoeven wrote:
> >   - Move SoC config options (moved in commit 062887bf5ef73313 ("ARM:
> >     shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")),
> >   - Move PCI config options (moved in commit eb01d42a77785ff9 ("PCI:
> >     consolidate PCI config entry in drivers/pci")),
> >   - Drop CONFIG_I2C_MUX=y (auto-enabled since commit ea6b13e9fed0fda9
> >     ("drm/bridge/sii902x: Add missing dependency on I2C_MUX")),
> >   - Drop CONFIG_SH_DMAE=y (no longer selectable since commit
> >     a19788612f51b787 ("dmaengine: sh: Remove R-Mobile APE6 support")),
> >   - Drop CONFIG_ARM_UNWIND (auto-enabled since commit f9b58e8c7d031b0d
> >     ("ARM: 8800/1: use choice for kernel unwinders")).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Would this change be any different if it was a refresh for v5.0-rc1?

No it wouldn't. Same for rc3.

> I ask because the ARM-SoC maintainers prefer the oldest possible of
> the current rc series to be used as a base.

Hence feel free to s/rc2/rc1/g or s/rc2/rc3/g.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
