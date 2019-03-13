Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705D3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46DBD2177E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfCMMOr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 08:14:47 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43619 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfCMMOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 08:14:46 -0400
Received: by mail-vs1-f68.google.com with SMTP id u6so834512vso.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 05:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3XJbCe2cu5yQQGQEqZVQjgi3nUrBAfVZLvFP+Me9S8=;
        b=OUtQf/DasFhJsCdL8hIU3OPMQqL6UhZ9rr9nhjAgyhv8cRNP7W7WUr+uwjAJcnXktn
         cXm/iZHyIS8cIr5ecVQBthwS3tnX2CbqxDOFXvGT6O67LDCMCIC62enGlHKErOwbdiK/
         P27QGqJnm2TqYK6y3txbrTCjLdXCJ21fLeHMRUll9IAUXPyc6BSCwCKvkBHfUwPUx0dW
         2xS1xroWuV4lC3OLGzkTX/f2Ut+fYZJBJnXY2hWwVF/WDgWpWVpN1J28KkS4nepalNDz
         CMJOss719ceMBqMUxWfnfjdyphd1Ji41KB3h5X7uP32ouvM1FIMSlXybD59FAK/6kzzg
         FVfg==
X-Gm-Message-State: APjAAAWAa/svEqjiGAq+BXYL/gM8v4sjthnZN59jZAp14RYOolKIK3r3
        3M5LHTKLWIhni2FzKbrqCMi+SJiWBc0IgYRIUW8=
X-Google-Smtp-Source: APXvYqwSIoUIXM2FOdSjty+BTAFSJ+t5V+qFixfEdnUn09W7budDvFTtgtNwkiBqi6hVH28ZtHC1cJJggAXa5Um+1ks=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr21872081vso.63.1552479285553;
 Wed, 13 Mar 2019 05:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
In-Reply-To: <20190313105816.8592-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Mar 2019 13:14:33 +0100
Message-ID: <CAMuHMdXsGTzsOUvYU_dgdcrj391vBYMZ446nT2M9Veu9hAPj8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: ebisu: support S2RAM
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Mar 13, 2019 at 11:58 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> this short series supports S2RAM on R-Car E3 (r8a77990) / Ebisu by:
>
> * Upporting description of  BD9571 PMIC in DT from BSP v3.9.2
> * Adding DDR0 backpo power configuration to that description
>
> Simon Horman (1):
>   arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup Power config
>
> Takeshi Kihara (1):
>   arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
>
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> Tested using the following procedure with patches applied
> on renesas-devel-20190308-v5.0 and kernel compiled using
> renesas_defconfig.
>
> 1. Add no_console_suspend to kernel command line
> 2. Boot system
> 3. # echo on > /sys/bus/i2c/drivers/bd9571mwv/8-0030/bd9571mwv-regulator.0.auto/backup_mode
> 4. Toggle SW23 to off position

I think one step is missing here:

    # echo mem > /sys/power/state

>    System suspends with following displayed on console
>
>    [   91.486537] PM: suspend entry (deep)
>    [   91.490281] PM: Syncing filesystems ... done.
>    [   91.500460] Freezing user space processes ... (elapsed 0.001 seconds)
>    done.
>    [   91.509392] OOM killer disabled.
>    [   91.512679] Freezing remaining freezable tasks ... (elapsed 0.001
>    seconds) done.
>    [   91.531235] ravb e6800000.ethernet eth0: Link is Down
>    [   91.670747] Disabling non-boot CPUs ...
>    [   91.676106] CPU1: shutdown
>    [   91.678932] psci: CPU1 killed.
>
> 5. Toggle SW23 to on position
>    System resumes with the following output to the console

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
