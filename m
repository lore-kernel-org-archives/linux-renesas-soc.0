Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A31C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 20:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8AA82080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 20:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbeLOUBM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 15:01:12 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37426 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbeLOUBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 15:01:12 -0500
Received: by mail-vs1-f66.google.com with SMTP id h18so5456789vsj.4;
        Sat, 15 Dec 2018 12:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+7lShuxQznWLm0LoBSPmcMkxe5vwEz5KpTWizPfGZc=;
        b=oiAYvZjh9cVS961z5Rkmf257EC+FRHZxb7aaWcKuCzHPACN7kSYwaYkBpaRp/eDuMx
         Eg8hAW6PcXul79mFZc66SMlbxExjH1vkHD32hskSCOWkSzD84VfDV+LZxM7C4SMRpAxk
         mWISYR0oqn7Qd08ZYT+gNYl9o9nyv2tO0Tp8Ym6Bcb89iD4m8b6QXoox9NSzoGTML7XG
         2SBBnz8ZuusCz4zRnyJkg8DmNxDji0MPIRSjMiu2tTnxpwzuA4jBg54nAqy8eydr2Xlz
         4w+AOWc0dzZ+2w9qkPtluU+k1fjMS3hUr2g1tqi9jIxNeBQTWcL/HvnL7L/gtjcW1K69
         EaCA==
X-Gm-Message-State: AA+aEWaoOzqL6ajcZN3CqVDHoJAOkHONA581aAzokFrMMWc9sp7ZyE/X
        xUb5X5KRNAXMXTj2N8Mnb+LHXKNfLWGJWCy1mQU=
X-Google-Smtp-Source: AFSGD/Vs6jW4ygstNhnOzkkEuYU35YSYgQHKZIXj9jJYmYHRWFiT8iGX1+n5hPsJKVmkAD/I8wWDfrgPBN12/p5WUGU=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr3783319vsm.152.1544904070703;
 Sat, 15 Dec 2018 12:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com> <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com> <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
In-Reply-To: <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 15 Dec 2018 21:00:58 +0100
Message-ID: <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
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

On Sat, Dec 15, 2018 at 8:07 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
> > On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
> >>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
> >>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
> >>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
> >>>>>> allows passing struct thermal_zone_params into it and convert original
> >>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
> >>>>>>
> >>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>
> >>>>> Git complains about mismatch between From: and this SOB.
> >>>>
> >>>> I recall a discussion about gmail stripping the +foo tags from email
> >>>> addresses. I can add a From: tag into the patch to override this
> >>>> braindeath, or is there a better solution ?
> >>>
> >>> Run the "git format-patch" command from a git repo where user.email
> >>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
> >>> email body, as it is different?
> >>
> >> I can also manually patch the From tags or add them, but it's all
> >> workarounds.
> >
> > Use a different outgoing email server? I use my ISP's.
>
> Or maybe it'd make sense to fix git to handle the +tags correctly ?

What needs to be fixed?
If user.email != From, git format-patch generates a From: header, else
it doesn't. Doesn't that make sense?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
