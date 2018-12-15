Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8F9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF7A72084D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbeLOSrv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 13:47:51 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36979 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLOSrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 13:47:51 -0500
Received: by mail-vk1-f194.google.com with SMTP id 197so2023905vkf.4;
        Sat, 15 Dec 2018 10:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ObJRi5R+/aU/iE+JPEet14HkbnKYzaaNGPSk6zWkp4=;
        b=BWWvVuQo8hbl1ULBXaFaLYH86MwPfKNmduOkuQWJraCn7P/QO7lsUWrRdOWJb+FO7X
         FWYGNLEE4tGzNnNL0rtJApDXZ3GKQCSryIfAGrWQofh8Xg4uWcx+2byOkqcSdMHsHaTW
         HmjKN8tdz5dCs0xynf71MRGRwWQqK8Tg2/gSIcWthxckM1f/WR3Rl8PACJrE0jmiv/DK
         wel5jzujvuIjkdyLbCurmM8uYSz1WGdtw9fCWjFNiopoh/dZdE6TicX60SnaNaKwSTwD
         3966fbA5iOPHnFy5H09GDDDhE/8wfi0JfaUwpL0VPUb6HVKo1qKzzuHvioL0ibqc1bOz
         qXtw==
X-Gm-Message-State: AA+aEWbV9IOFQpYgAsoZC5OQ6Yj+RTFpq72Wb/mlH4KOQJNZz93dtcPt
        1xao3mfVwE661/tR1x1nFzLctYx8YHCrjQ6323U=
X-Google-Smtp-Source: AFSGD/Vnq+IfcvsNdmkxU0C96QIddyfv8/C7amApf2b1jRC7AOFjqwcWz0ncC3Tlc2cZ3aleDaHk4U5ogIoSrcqXfR0=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr3484407vkd.74.1544899670218;
 Sat, 15 Dec 2018 10:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
In-Reply-To: <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 15 Dec 2018 19:47:37 +0100
Message-ID: <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
Subject: Re: [PATCH 1/6] thermal: split thermal_zone_of_sensor_register{,_param}()
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
> > On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
> >> Introduce new thermal_zone_of_sensor_register_params() function, which
> >> allows passing struct thermal_zone_params into it and convert original
> >> thermal_zone_of_sensor_register() to call it with params set to NULL.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > Git complains about mismatch between From: and this SOB.
>
> I recall a discussion about gmail stripping the +foo tags from email
> addresses. I can add a From: tag into the patch to override this
> braindeath, or is there a better solution ?

Run the "git format-patch" command from a git repo where user.email
is marek.vasut@gmail.com, so it will retain the original From: tag in the
email body, as it is different?

> >> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Cc: Eduardo Valentin <edubezval@gmail.com>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: Zhang Rui <rui.zhang@intel.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> To: linux-pm@vger.kernel.org
> >
> > I would prefer if you put your SOB at the bottom.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
