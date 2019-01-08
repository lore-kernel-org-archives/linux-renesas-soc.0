Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E156C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0789C206B7
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfAHJfn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 04:35:43 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43244 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfAHJfn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 04:35:43 -0500
Received: by mail-vk1-f193.google.com with SMTP id o130so718271vke.10;
        Tue, 08 Jan 2019 01:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ro/Ub7Vw0Ye/84tmdS2mIOeRcfxDU2aK+vg/onYB148=;
        b=H90s3TvgZwxBjXiCbGNGyKe2kcx1gvYHRsyekfq8cZ7KUJ5HlQOsMMIoQY2ya3Fun1
         3xCvU9KOfd/oQ136GMApMuEOK6rO3VUsjoCMcVV4cRGDUmkj0jHuI01Ylp0wPejVvAVi
         yJRIMf+7Rf6gMaWs1XnZw/NxNWzNnx+v0b8jsACajU8BcngcEeWu9yAxkLBKVNsN0QDe
         45uTziK+9c4W1/Px/ThPLGgu/8F/b7uR6t4oA3SG1CsrdZ1onj4nHmMCO8Y53SG1KEmi
         VDtaixXRYJAAY9M2vNs2wepsyMKm+xqa9X7mt9x1If4usiH9RfnCMdaGIDyDz280bcbs
         ZMDQ==
X-Gm-Message-State: AJcUukd430eq9m1Tk0swrCYXOGPFqocs39T3u++GOcrinvTCQ+ayHiUV
        cmtq8kDS4WM8NQS/PucTHtKQ9sPhIgxGEeJML8s=
X-Google-Smtp-Source: ALg8bN5+oMM664lcPjSQVYkdSVmtmQhy0vJkVYuvVd6boKn6KuXt/59OTMdkzRfVEBw7moT7B9D45uFBGl/Q+SAhJXs=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr357793vkd.74.1546940141598;
 Tue, 08 Jan 2019 01:35:41 -0800 (PST)
MIME-Version: 1.0
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190108074749.d23mpcr3wscr6s5j@pengutronix.de> <CAMuHMdUdrfjUHzOZr25a4JsRNK34KL8kA1s1G+BrpRzZgtB-7w@mail.gmail.com>
 <20190108091925.gcv6tqkvxr2ilj3w@pengutronix.de>
In-Reply-To: <20190108091925.gcv6tqkvxr2ilj3w@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jan 2019 10:35:29 +0100
Message-ID: <CAMuHMdVxdG6DsXxa6T+u7F9HniywjwQneQ5GZ6xoEai89nu-9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

On Tue, Jan 8, 2019 at 10:19 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jan 08, 2019 at 09:56:28AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 8, 2019 at 8:48 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > Orthogonal to this patch I wonder what the intended behaviour for a pwm
> > > is on suspend. Should it stop oscilating unconditionally? Or should it
> > > only stop if the consumer stops it as part of its own suspend callback?
> >
> > I guess you mean system suspend, not runtime suspend, as the device is
> > runtime-resumed when a PWM is requested?
>
> I admit that suspend (both system and runtime) is a bit of a black box
> for me. So please take that into account when judging my statements.
>
> > Permitted behavior depends on the system: on R-Car Gen3 (arm64), PSCI system
> > suspend will power down the SoC, so PWM output will stop for sure.
> >
> > On R-Car Gen2 (or R-Car Gen3 with s2idle instead of s2ram), the PM Domain
> > code will turn of the PWM module's clock. Hence it will stop oscillating, unless
> > you take special countermeasures, like for modules that need to stay powered
> > for wake-up handling.
>
> Whatever "suspend" here means, I want to prevent that a stopping pwm is
> a surprise for the consumer. So I think suspend should be inhibited if
> the consumer might expect the pwm to continue running but the pwm is
> about to stop. So if the suspend affects the consumer, too, it's the
> consumer that should be responsible to stop the pwm in a controlled
> manner.

I think you can inhibit suspend by letting the .suspend() callback return an
error. However, I think the PWM driver cannot make that decision on its own.
Shutting down the PWM for a status LED is harmless, and the status LED being
enabled should not prevent a system suspend.
Shutting down e.g. a motor may be different.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
