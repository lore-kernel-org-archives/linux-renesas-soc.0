Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3D8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B31E20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbeLQNgi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:36:38 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:36419 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbeLQNgi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:36:38 -0500
Received: by mail-vk1-f195.google.com with SMTP id 185so1156708vkc.3;
        Mon, 17 Dec 2018 05:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZZMRkOEtWlzSP+koqifUn8BAcLuV1OJS/ZO4VTNhck=;
        b=RZAuRV53McJ/KT0T1jbkezsbF+vJp2guKFRq6lWV8zPdY38pU2WLIo4MBdFUZ8AwSh
         /xtvLljfCnm4x8u6SUGsyhvsgNlHGO+GxLCq9mMaIlb5EFrI+EtutfUTxzWH2rreqV3C
         b9e73NRzA5FjU0s7VDDBJ5nzCsvpSVufyCkvrJ3IHSuZ4EikQX3QEcUFaFl20Etz1WwK
         CWLrSOjdk5Dun2rqsOg104lIo7YpL41D1bEGfzSpmmuUcXJjGXZGYCfkrqN2giQAxDfV
         DASmZmnJRvDL10q8HRZ2ZasZOhuZj5IFAe3s0SZ8qDa89Xczp8vP3xm1wof/ZQQSVNDq
         u88g==
X-Gm-Message-State: AA+aEWZPr1LCdBWtP8xLGFan9vVfCVrH0X3wZ/UR2WJoVOp6FO/T1vsK
        GRb10BPfuRKNbRuDZcL2COeb4M6ZMynJcUUeFYg=
X-Google-Smtp-Source: AFSGD/Vrqt1dWAHxEZiO8qJYO0PKBBYMKAbOsv9pgR4Wm85jMg+92FSZU06n2p6ptLiGMzZhvGF7hsOSNvba4E1nCsU=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr3633610vke.83.1545053797016;
 Mon, 17 Dec 2018 05:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com> <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com> <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com> <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com> <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com> <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com> <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
 <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com> <CAMuHMdWUNiCf8GXGq-cThF+h8JwQv6ZQJEC5D4vqQ=AF-9GsOw@mail.gmail.com>
 <726916ff-c2d8-374c-a69d-8b19f9a251b5@gmail.com>
In-Reply-To: <726916ff-c2d8-374c-a69d-8b19f9a251b5@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 14:36:25 +0100
Message-ID: <CAMuHMdX-qh_LGG8=qZHusp8oMZcOT9dqeoFbBBrpjuOxHAkxxA@mail.gmail.com>
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

On Mon, Dec 17, 2018 at 2:28 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/17/2018 02:26 PM, Geert Uytterhoeven wrote:
> > On Sun, Dec 16, 2018 at 9:50 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >> On 12/16/2018 09:08 PM, Geert Uytterhoeven wrote:
> >> [...]
> >>
> >>>>>>> Git actually does that automatically, assumed your user.email config matches
> >>>>>>> the From: address that is used in your outgoing email delivery path (i.e. the
> >>>>>>> scrubbed one, when using Gmail's SMTP server).
> >>>>>>> If you lie to git in your user.email config, git cannot do the right
> >>>>>>> thing, obviously.
> >>>>>>
> >>>>>> My git user.email obviously matches the From: field , before the
> >>>>>> scrubbing, which I believe is the correct thing to do.
> >>>>>
> >>>>> I disagree, because that is not how the emails are actually going out from the
> >>>>> SMTP server you are using.
> >>>>
> >>>> Can you summarize, clearly, what you believe is the right thing to
> >>>> configure and where ?
> >>>
> >>> According to git-send-email(1), you can either pass your scrubbed email
> >>> address to --from, or configure it in the sendemail.from config option.
> >>> Does that work for you?
> >>
> >> So sendemail.from != user.email , the later has the +tag while the
> >> former does not ?
> >
> > Right.
> >
> >>>>>>>> from the same person/email address as the email address in From, so they
> >>>>>>>> are equal.
> >>>>>>>
> >>>>>>> If they differ, they are not equal ;-)
> >>>>>>
> >>>>>> Depends on how you define 'equal' . Here I think foo+bar@example.com
> >>>>>> should be considered equal to foo@example.com .
> >>>>>
> >>>>> That is domain-specific knowledge, which you cannot rely upon.
> >>>
> >>>>>> Aha, so maybe that enhancement needs further enhancement to scrub the
> >>>>>> +tags before the check ?
> >>>>>
> >>>>> Again, that is domain-specific knowledge, which you cannot rely upon.
> >>>>
> >>>> How so, please elaborate .
> >>>
> >>> In general, you cannot assume the "+foo" part can be ignored. Only the sender
> >>> knows.
> >>
> >> How so ?
> >
> > It depends on the domain.
> >
> > Is Bill.Gates@microsoft.com the same email address as
> > Bill.Gates+foo@microsoft.com?
> > Is Bill.Gates+1955@microsoft.com the same?
> > Is Bill.Gates-1955@microsoft.com the same?
> >
> > I don't know. Only microsoft.com knows.
> > So that's why you should compare email addresses verbatim (but case
> > insensitive).
>
> Oh, you mean email-domain. In that case, since gmail treats
> foo@gmail.com the same as foo+bar@gmail.com , checkpatch should treat
> them equally as well. In which case, your checkpatch patch which now
> generates a warning on this is wrong ?

So checkpatch should know about all email domains?

Just fix your setup. All patch statistics operate on the author, incl. +foo, so
your patches will be attributed wrongly.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
