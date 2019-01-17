Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F357C43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 09:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6795C20855
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 09:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfAQJD3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 04:03:29 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37653 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfAQJD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 04:03:28 -0500
Received: by mail-vs1-f66.google.com with SMTP id n13so5779867vsk.4;
        Thu, 17 Jan 2019 01:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9wQnV1cCmFpNsn3G/rCci65iQKeIIR+smL+xWNE44U=;
        b=frCrdiNAMD+WSBZDmK2IU4JOEZEwuxgqouDaxJfcCDQKstIErZmFHqVMovHrCuF+yU
         KKsPVSYnkbMytR33bpFFwulrgiwNB+vEUdcolI4017n2+8ZJhicqJ59Ug65LKMWocy4e
         CGBrhQ+0jgYSfHJ8eJPOJSh0m1hxDQGOO6Vrm5WBfxCNfzY20VnPOL5b61uE1Y2844cd
         bXQuCljrdRxjugsr4TZSDkrn2Ci/zBrq1j192/5QaaiVsmL88+3vXD8etWW5NXjfkJiT
         95J8WtE/xsvZLwYfd/6ZwhHuT314xHhcYTqBQeqSvsQfJ+38F2gL6k+oQFyrwPWB3oLn
         uZrQ==
X-Gm-Message-State: AJcUukceKi1yxgF+g/l602HW0JFmNyb4lYTztdjUTVLPZQ46TcOxEvBC
        mTPoC8DiZLEyjkaRB7IWIyqlsN561bmuobaR3PQ=
X-Google-Smtp-Source: ALg8bN74iOVhw2xGGno7AeCOCwUhEQxqJdfs+rujh5Til8Al1kD7lXwzysZ2O7/QKyMvDOUetWDfLsUx4EXPjNr62GA=
X-Received: by 2002:a67:3885:: with SMTP id n5mr4856695vsi.96.1547715807145;
 Thu, 17 Jan 2019 01:03:27 -0800 (PST)
MIME-Version: 1.0
References: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 10:03:15 +0100
Message-ID: <CAMuHMdU_dbRp2Yqjjd4Vi-1bV4vSQe=UOEcrvCumfoYifzQzxw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks explicit
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC linux-pm people

On Thu, Jan 17, 2019 at 9:48 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
>
> This commit fixes the issue that USB-DMAC hangs silently after system
> resumes on R-Car Gen3 hence renesas_usbhs will not work correctly
> when using USB-DMAC for bulk transfer e.g. ethernet or serial
> gadgets.
>
> The issue can be reproduced by these steps:
>  1. modprobe g_serial
>  2. Suspend and resume system.
>  3. connect a usb cable to host side
>  4. Transfer data from Host to Target
>  5. cat /dev/ttyGS0 (Target side)
>  6. echo "test" > /dev/ttyACM0 (Host side)
>
> The 'cat' will not result anything. However, system still can work
> normally.
>
> Currently, USB-DMAC driver does not have system sleep callbacks hence
> this driver relies on the PM core to force runtime suspend/resume to
> suspend and reinitialize USB-DMAC during system resume. After
> the commit 17218e0092f8 ("PM / genpd: Stop/start devices without
> pm_runtime_force_suspend/resume()"), PM core will not force
> runtime suspend/resume anymore so this issue happens.
>
> To solve this, make system suspend resume explicit by using
> pm_runtime_force_{suspend,resume}() as the system sleep callbacks.
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()is used to make sure USB-DMAC suspended
> after and initialized before renesas_usbhs."
>
> Signed-off-by: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Cc: <stable@vger.kernel.org> # v4.16+
> [shimoda: revise the commit log and add Cc tag]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

This is similar in spirit to commits 1131b0a4af911de5 ("dmaengine:
rcar-dmac: Make DMAC reinit during system resume explicit") and
73dcc666d6bd0db5 ("dmaengine: rcar-dmac: Fix too early/late system
suspend/resume callbacks") for rcar-dmac.

I'm only wondering if the "late" variant would be sufficient here.
Does g_serial support wake-up?
Anyway, using the "noirq" variant, like you did, is probably the safest.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/dma/sh/usb-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> index 7f7184c..59403f6 100644
> --- a/drivers/dma/sh/usb-dmac.c
> +++ b/drivers/dma/sh/usb-dmac.c
> @@ -694,6 +694,8 @@ static int usb_dmac_runtime_resume(struct device *dev)
>  #endif /* CONFIG_PM */
>
>  static const struct dev_pm_ops usb_dmac_pm = {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                                     pm_runtime_force_resume)
>         SET_RUNTIME_PM_OPS(usb_dmac_runtime_suspend, usb_dmac_runtime_resume,
>                            NULL)
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
