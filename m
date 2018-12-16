Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6846C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D8262086C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbeLPKDf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:03:35 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46590 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbeLPKDe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:03:34 -0500
Received: by mail-vs1-f66.google.com with SMTP id n10so5975066vso.13;
        Sun, 16 Dec 2018 02:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/k/MotIeUyjrdIbhHa6zsnRPymkmGbSg+CTGYxCOQA=;
        b=kaw+RAptzRv39dfZMKe9ckYmcKIhbAGmu/5mup7vEse5HIbcCSByCHcmZ6XDjqTS5r
         Oy+0xZKLb2ZosoY1qtZz6BAZynKV/2M/EJBuv3Wjh4OBotSQQ1QxYFkvi01Kb5mD1G2Q
         cDt31XRljXF0GgIYdQfQBZbB5lyji/6cCuEoSjn8uIOLrGxqbz4yhqT1Zde/ZMHEtJln
         MI7QhkvnrfPrsN0rf7XcRc+tOYRD2W+g3n27MHlFu3p5JwpYh0RwVVZgC5iMzVoV9pU9
         FcZKsiCUmgPyvoiPL1SoJ6ezwuyhHShxbhQeTXGRl51Mg8d/i9SMJQLRefWP7tqN8U1y
         gz/w==
X-Gm-Message-State: AA+aEWbxw4+VSEEIlkUf+8GXmdu/SHyNAOx1iUa4LezZIACX0L1xoRvI
        p3rlQJGf3IG1wTYut0VRTjFunzE+IYzblAfcmiU=
X-Google-Smtp-Source: AFSGD/Wy2E0whRnS8/YxFNwzosl+4bVWWr4/B1f6hp7pBjdCjgOsQ7RizwjUbvzJDHSDcOrcIwpTIYjGZbpGxJEbgYY=
X-Received: by 2002:a67:3885:: with SMTP id n5mr3956941vsi.96.1544954613224;
 Sun, 16 Dec 2018 02:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Dec 2018 11:03:21 +0100
Message-ID: <CAMuHMdVd=TOgs0FM5GxPor7JLYFdN_M1Qs5nsm2EBcz8OJ_KHw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output states
To:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vladimir,

(increasing review priority due to Linus applying the patch)

On Mon, Dec 10, 2018 at 3:22 PM Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> R-Car GPIO controller provides two interfaces to set GPIO line output
> signal state, and for a particular GPIO line the selected interface is
> determined by OUTDTSEL bit value.
>
> At the moment the driver supports only one of two interfaces, namely
> OUTDT General Output Register is used to control the output signal.
>
> While this selection is the default one on reset, it is not explicitly
> configured on probe, thus it might be possible that kernel and userspace
> consumers of a GPIO won't be able to set the wanted GPIO output signal.
>
> Below is a simple test case to reproduce the described problem and
> verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
> configuration from a bootloader:
>
>   u-boot    > mw.l 0xe6055440 0x3000 1
>   ...
>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger
>
> Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Thanks for your patch!

> The proposed change could be seen as an invitation for a more interesting
> discussion about a necessity to add a pretty trivial support of the second
> interface, for instance by selecting between OUTDT and OUTDTH/OUTDTL on
> basis of read-only value of OUTDTSEL register, or, simply by switching
> the driver to use the second interface only, because it does not require
> an additional gpio_rcar_read() call, theoretically it should give noticeably
> faster rate of bitbanging.
>
> For reference the problem with the original interface comes from an inability
> to set GPIO output signals from an RTOS, which runs in parallel to Linux and
> wants to control some GPIOs on its own, usage of OUTDTH/OUTDTL excludes
> a race in concurrent read/write register operations.
>
> As a note in my opinion the selection of OUTDT vs. OUTDTH/OUTDTL should
> NOT be done in DTS, extension to 3-cell values for GPIO consumers seems
> unreasonable.

Indeed, this is pure software configuration, not hardware description, so it
does not belong in DT.

> Below is the list of helpful tips for change reviewers, comments are welcome:
> * I didn't manage to find H1 or M1A User's Manuals to confirm that
>   OUTDTSEL register and the second OUTDTH/OUTDTL interface is present
>   on the GPIO controllers found on R-Car Gen1 SoCs,

Unfortunately R-Car M1A and H1 do not have the OUTDTSEL nor OUTDTH/OUTDL
registers. So your patch may break them.

> * Fixes tag here is pretty weak, nevertheless I suppose it is a fix in fact,

IMHO the SHA1 is not appropriate, as commit 119f5e448d32c ("gpio: Renesas
R-Car GPIO driver V3") added support for R-Car Gen1 only, while the OUTDT*
registers appeared in R-Car Gen2.

> * gpio_rcar_suspend()/gpio_rcar_resume() don't respect OUTDTSEL/OUTDTH/OUTDTL
>   values, if there is a reason to dump/restore registers, it might be good
>   to include them to the list also,

Given resume calls gpio_rcar_direction_{in,out}put(), at least OUTDTSEL
will be restored for output. Is that sufficient, or should it be restored for
input, too?

> * alternatively it might be possible to replace the original interface with
>   OUTDTH/OUTDTL one, it will be a nice valid fix also.

Unfortunately that is not supported by all SoCs supported by the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
