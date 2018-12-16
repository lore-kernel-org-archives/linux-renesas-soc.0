Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8351D217FA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730945AbeLPUIQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:08:16 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:43569 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730746AbeLPUIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:08:15 -0500
Received: by mail-vk1-f195.google.com with SMTP id o130so2400619vke.10;
        Sun, 16 Dec 2018 12:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BkpM/+1/FoGXGEXLi6nAqI/JISwIRxiaGBup+eiwPdw=;
        b=elnL7nFQpY3/M8PvuAAmDc1qW8r+QZOuuS3l/T5/HUjUUew6e6+uHQ2QYI58DuJt8L
         yOMghP9AlVl6lRFRPWfxcsZTqv6g8TWNw9xexfaT1ORuvBbGtTJweeyBLGyvTSMPCma2
         4mouNWWu6W4QcHqwMWf3TbpYA2mRWOMwdnyAsVk/Ygbqt9je3kCP5Ic4rVFp3NlGeETt
         ibk6oC7TUDOXXfEhbKqEpSYRMxx28vVl0kt8tz8r0BdNR3Ck1H3KPpOPLcKo8tH+rqG/
         DFdBd1mdWL94xoNapPWhPM+vyLw1RJES9wzSIVUZjaNjqzUifooNtHktzIrRh0NB4NHs
         vPvg==
X-Gm-Message-State: AA+aEWaq/CeXYgrbP/OPc7nmQbG6Qm3HDzdGr8VI9C/2wOTVo4JXXaSB
        6iCKIvy6n3M8SxeUtZ5hqblpUZlP0yWZmSZUKHA=
X-Google-Smtp-Source: AFSGD/XY5P3ZUfm38Kc06icwBBKvQ5tdw7hes8gnY/mWdR0EiO+l5sQqXggx04a6c5g4WC54FokNxuHa42oKvNNODpo=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr4853389vkd.74.1544990892953;
 Sun, 16 Dec 2018 12:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com> <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com> <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com> <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com> <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com> <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
In-Reply-To: <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Dec 2018 21:08:00 +0100
Message-ID: <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
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

On Sun, Dec 16, 2018 at 6:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/16/2018 06:42 PM, Geert Uytterhoeven wrote:
> > On Sun, Dec 16, 2018 at 6:25 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >> On 12/16/2018 09:39 AM, Geert Uytterhoeven wrote:
> >>> On Sat, Dec 15, 2018 at 9:13 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>> On 12/15/2018 09:00 PM, Geert Uytterhoeven wrote:
> >>>>> On Sat, Dec 15, 2018 at 8:07 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>>>> On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
> >>>>>>> On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>>>>>> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
> >>>>>>>>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >>>>>>>>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
> >>>>>>>>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
> >>>>>>>>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
> >>>>>>>>>>>> allows passing struct thermal_zone_params into it and convert original
> >>>>>>>>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>>>>>>>
> >>>>>>>>>>> Git complains about mismatch between From: and this SOB.
> >>>>>>>>>>
> >>>>>>>>>> I recall a discussion about gmail stripping the +foo tags from email
> >>>>>>>>>> addresses. I can add a From: tag into the patch to override this
> >>>>>>>>>> braindeath, or is there a better solution ?
> >>>>>>>>>
> >>>>>>>>> Run the "git format-patch" command from a git repo where user.email
> >>>>>>>>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
> >>>>>>>>> email body, as it is different?
> >>>>>>>>
> >>>>>>>> I can also manually patch the From tags or add them, but it's all
> >>>>>>>> workarounds.
> >>>>>>>
> >>>>>>> Use a different outgoing email server? I use my ISP's.
> >>>>>>
> >>>>>> Or maybe it'd make sense to fix git to handle the +tags correctly ?
> >>>>>
> >>>>> What needs to be fixed?
> >>>>> If user.email != From, git format-patch generates a From: header, else
> >>>>> it doesn't. Doesn't that make sense?
> >>>>
> >>>> I believe the complaint here is that email address in From does not
> >>>> match email address in SoB line, because some SMTP servers scrub the
> >>>> +foo tag from From: and not from SoB-line . And yet, the SoB line is
> >>>
> >>> Some SMTP servers (Hi Gmail!) scrub the +foo tag from the From: _header_
> >>> in the email. As the SoB is in the _body_ it is not affected.
> >>> Hence the solution is to include the correct From: in the _body_.
> >>
> >> This is basically what I said.
> >>
> >>> Git actually does that automatically, assumed your user.email config matches
> >>> the From: address that is used in your outgoing email delivery path (i.e. the
> >>> scrubbed one, when using Gmail's SMTP server).
> >>> If you lie to git in your user.email config, git cannot do the right
> >>> thing, obviously.
> >>
> >> My git user.email obviously matches the From: field , before the
> >> scrubbing, which I believe is the correct thing to do.
> >
> > I disagree, because that is not how the emails are actually going out from the
> > SMTP server you are using.
>
> Can you summarize, clearly, what you believe is the right thing to
> configure and where ?

According to git-send-email(1), you can either pass your scrubbed email
address to --from, or configure it in the sendemail.from config option.
Does that work for you?

> >>>> from the same person/email address as the email address in From, so they
> >>>> are equal.
> >>>
> >>> If they differ, they are not equal ;-)
> >>
> >> Depends on how you define 'equal' . Here I think foo+bar@example.com
> >> should be considered equal to foo@example.com .
> >
> > That is domain-specific knowledge, which you cannot rely upon.

> >> Aha, so maybe that enhancement needs further enhancement to scrub the
> >> +tags before the check ?
> >
> > Again, that is domain-specific knowledge, which you cannot rely upon.
>
> How so, please elaborate .

In general, you cannot assume the "+foo" part can be ignored. Only the sender
knows.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
