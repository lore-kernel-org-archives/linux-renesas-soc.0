Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC17C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 08:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9140C2084D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 08:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbeLPIjU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 03:39:20 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:46153 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPIjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 03:39:19 -0500
Received: by mail-vk1-f193.google.com with SMTP id j23so2206128vke.13;
        Sun, 16 Dec 2018 00:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3jwtiejl3CW5mq17XZRV/CJFpmLbFfvUHYGdMC/M6Y=;
        b=qLy4BIW3uYMU18TWa5Wmvi/pLDM/v7idaqDYISedkGAMHjCtxBUglyzK/xh466AJbp
         gPcSe/TcembOUThmBTdBEEC/H6GSJp7ER6huDAHgxBUDn3LzfxsCs3XTYsbi0EcComnz
         WcoGmAFaSKGPCFqvHaikuw2rHGxGSrS0JiqPGSDrzc8tA1BELUPuY1aZuUCnSSJaaLpv
         aI8X6lsAfWpcYQgD62Of8C1mPIIJ3cP8jIhy1Kyv8B5KL4SqdT9sjmgnou8q6TPYLd+s
         42KnvgODQKt05N+9mgREXX72j/5PVdqEghJuaXSOfDN184zSWjvFEXQSe+bmjNANmYmT
         QzPA==
X-Gm-Message-State: AA+aEWYqGsuWc8kM6VIhLCrt5ben3PFbQcZVIWfkZfNMDxO3vQl36Lde
        cdwR+zLLAFk9iay83RIxcxNNK1cU7VgA2yk6od0=
X-Google-Smtp-Source: AFSGD/UfH55W48dPfFiF+A3Jd168T1A6M2wiY0Vd8arQPEXt8ryKchXrwgRHT1PgqN50JUQY8bahn+MueOESf+igM+k=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr4209131vkd.74.1544949558322;
 Sun, 16 Dec 2018 00:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com> <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com> <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com> <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
In-Reply-To: <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Dec 2018 09:39:05 +0100
Message-ID: <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
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

On Sat, Dec 15, 2018 at 9:13 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/15/2018 09:00 PM, Geert Uytterhoeven wrote:
> > On Sat, Dec 15, 2018 at 8:07 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >> On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
> >>> On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
> >>>>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
> >>>>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
> >>>>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
> >>>>>>>> allows passing struct thermal_zone_params into it and convert original
> >>>>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>>>
> >>>>>>> Git complains about mismatch between From: and this SOB.
> >>>>>>
> >>>>>> I recall a discussion about gmail stripping the +foo tags from email
> >>>>>> addresses. I can add a From: tag into the patch to override this
> >>>>>> braindeath, or is there a better solution ?
> >>>>>
> >>>>> Run the "git format-patch" command from a git repo where user.email
> >>>>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
> >>>>> email body, as it is different?
> >>>>
> >>>> I can also manually patch the From tags or add them, but it's all
> >>>> workarounds.
> >>>
> >>> Use a different outgoing email server? I use my ISP's.
> >>
> >> Or maybe it'd make sense to fix git to handle the +tags correctly ?
> >
> > What needs to be fixed?
> > If user.email != From, git format-patch generates a From: header, else
> > it doesn't. Doesn't that make sense?
>
> I believe the complaint here is that email address in From does not
> match email address in SoB line, because some SMTP servers scrub the
> +foo tag from From: and not from SoB-line . And yet, the SoB line is

Some SMTP servers (Hi Gmail!) scrub the +foo tag from the From: _header_
in the email. As the SoB is in the _body_ it is not affected.
Hence the solution is to include the correct From: in the _body_.

Git actually does that automatically, assumed your user.email config matches
the From: address that is used in your outgoing email delivery path (i.e. the
scrubbed one, when using Gmail's SMTP server).
If you lie to git in your user.email config, git cannot do the right
thing, obviously.

> from the same person/email address as the email address in From, so they
> are equal.

If they differ, they are not equal ;-)
While many mail servers ignore +foo when delivering email to mailboxes,
this is not the case for all of them.  So ignoring +foo is not the universal
solution.

> I think git should just ignore the +foo tag in SoB line.

Where should "git" ignore the +foo tag? Is it actually git that complains?
Eduardo: Do you mean checkpatch? ;-)

I did enhance checkpatch with a check to verify that patches carry SoB tags
from their authors, as too many people got that wrong, causing complaints
from sfr in linux-next later. As usual, it's better to get things right as early
as possible in the process, to avoid rework.

So the problem is on the patch sending side, not on the patch verification
receiving side.
Hence please fix your email setup, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
