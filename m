Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854C8C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5644D20870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfAWO7T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 09:59:19 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46791 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfAWO7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 09:59:18 -0500
Received: by mail-vs1-f66.google.com with SMTP id n10so1430496vso.13;
        Wed, 23 Jan 2019 06:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03Rme0ToKDvafbsERmAM/AvOS+Q8IK4MRzPugTnEve0=;
        b=kXx+YmrKnIWJfKtPnbhuQ8CRnQWbEZ3GG4wtdw3iCOi7nSfHWiOW4eLLHpgCsAzNTe
         pyG8gHq4gElRduUOT/hCvI0wRlMCzsXQW7lun5wJ4bLJUsfHqt2lokxlTQNNE4Nnr1dS
         tlCTTjj1gePBzyItrXqE1D452G6f/Pz9r4QYBqCfw46YDMKTv3k4xL34xki93Kc7sOcd
         nBg19uYwMC4NVLV/jhBUiQwVq80lUoxdB8yNGsQ/DwzhSBI9Y7xSE8BcKHZ6LkibXMuI
         nJaA68WLraLZDxFBBNWCKrEAp+PtREZggNQbzBnHEM6UxPc8iRogqUAaRM2L2edn3HE4
         4+4w==
X-Gm-Message-State: AJcUukeuzSPPgTSTgCR7j3xkf/D4uF2APP8LdBh+UNk6YPx5nQFOjwI9
        lij4khqSn73f0pm47rR4dIXn1cwd4Q9eFUTeyx4=
X-Google-Smtp-Source: ALg8bN5y9zUb+0VmRUKIP9G0UlumwHMPd2u2hZyWSdSDZhDLVdTCO0adaytJnLEAxrkCWOBQhtoUT5WSM8DJZwaH+9I=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr1004874vsm.152.1548255557402;
 Wed, 23 Jan 2019 06:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20190123134833.119031-1-chris.brandt@renesas.com>
 <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com> <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jan 2019 15:59:05 +0100
Message-ID: <CAMuHMdUsJ5dhH5Rz8iWW8ocbnwaEeSBL9ToKibb5Sj29Y0jRog@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Wed, Jan 23, 2019 at 3:10 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, January 23, 2019, Rob Herring wrote:
> > Please check your changes with 'dt_binding_check' target. This will
> > fail. 'description' already has a value, so you can't add a list to
> > it. And description has to be a string.
> >
> > >          items:
> >
> > Move the 2 lines here.
> >
> > >            - const: renesas,r7s9210
>
> I can't find 'dt_binding_check' (I guess it's only in the DT tree).

This seems to be a make target: "make dt_binding_check"
(included in last renesas-drivers).

This needs "dt-mk-schema", which you can find in
https://github.com/robherring/yaml-bindings

Cloned, patch sent for missing python3-pip dependency, installed, put in $PATH,
and now it seems to like your v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
