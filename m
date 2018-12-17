Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9925C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:26:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F4BF2146E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732691AbeLQN0o (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:26:44 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43027 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732510AbeLQN0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:26:44 -0500
Received: by mail-ua1-f65.google.com with SMTP id z11so4398167uaa.10;
        Mon, 17 Dec 2018 05:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pccTC63C+lQdjSZmfnXxolQi1CvHkUj/PbFYZrHdocI=;
        b=buaOOVRPvjK9+VGcF7SLL3kNLJx4V+Uwf3f+llF6JX/7Ks3IAWGxG/b8Nflr0/Ey8c
         n8wr7CiU34WdqFtjfZqhxxpXEUDEuNy9NVzsrDEZotsIaSlNMSJ5jQw/8n2wFDc5Ke2F
         meiC6eoGObUk3CPXTBbFP38DRM743wj5aMtssxeouEokBy2iEd7wmGkZgqYnAe2wcCil
         V/2WScnTVPKaBEpQDhLWH1M7ZGvh6chJlpTPTGVbyC+00SGQ5yeLpf67EIEBwS/4Sf83
         msOyyPOAaTdiUAos9zw3KECQT9hE272AFlScbxYgE4LxqT4tGxJ8ogjCUKGPv7GUbKIY
         XdUw==
X-Gm-Message-State: AA+aEWaRqBZA/6c0j78IqKBC7uAdEkXzHyXD9wq18mkzfmULexupfrZZ
        /CTyh1a60NWhFcupU8/trgWBJ5PR6m2UtVAOCzM=
X-Google-Smtp-Source: AFSGD/VUXAu5QfiEyOaoh4RAGXBRQhlREyE5K4HFOtvAG02dVQtQI9UtTXpzoMxkcWwRE2ndr0FuNubuTenEWdTVYmw=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr6431574uap.0.1545053202594;
 Mon, 17 Dec 2018 05:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com> <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com> <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com> <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com> <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com> <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com> <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com> <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
 <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com>
In-Reply-To: <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 14:26:29 +0100
Message-ID: <CAMuHMdWUNiCf8GXGq-cThF+h8JwQv6ZQJEC5D4vqQ=AF-9GsOw@mail.gmail.com>
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

On Sun, Dec 16, 2018 at 9:50 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/16/2018 09:08 PM, Geert Uytterhoeven wrote:
> [...]
>
> >>>>> Git actually does that automatically, assumed your user.email config matches
> >>>>> the From: address that is used in your outgoing email delivery path (i.e. the
> >>>>> scrubbed one, when using Gmail's SMTP server).
> >>>>> If you lie to git in your user.email config, git cannot do the right
> >>>>> thing, obviously.
> >>>>
> >>>> My git user.email obviously matches the From: field , before the
> >>>> scrubbing, which I believe is the correct thing to do.
> >>>
> >>> I disagree, because that is not how the emails are actually going out from the
> >>> SMTP server you are using.
> >>
> >> Can you summarize, clearly, what you believe is the right thing to
> >> configure and where ?
> >
> > According to git-send-email(1), you can either pass your scrubbed email
> > address to --from, or configure it in the sendemail.from config option.
> > Does that work for you?
>
> So sendemail.from != user.email , the later has the +tag while the
> former does not ?

Right.

> >>>>>> from the same person/email address as the email address in From, so they
> >>>>>> are equal.
> >>>>>
> >>>>> If they differ, they are not equal ;-)
> >>>>
> >>>> Depends on how you define 'equal' . Here I think foo+bar@example.com
> >>>> should be considered equal to foo@example.com .
> >>>
> >>> That is domain-specific knowledge, which you cannot rely upon.
> >
> >>>> Aha, so maybe that enhancement needs further enhancement to scrub the
> >>>> +tags before the check ?
> >>>
> >>> Again, that is domain-specific knowledge, which you cannot rely upon.
> >>
> >> How so, please elaborate .
> >
> > In general, you cannot assume the "+foo" part can be ignored. Only the sender
> > knows.
>
> How so ?

It depends on the domain.

Is Bill.Gates@microsoft.com the same email address as
Bill.Gates+foo@microsoft.com?
Is Bill.Gates+1955@microsoft.com the same?
Is Bill.Gates-1955@microsoft.com the same?

I don't know. Only microsoft.com knows.
So that's why you should compare email addresses verbatim (but case
insensitive).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
