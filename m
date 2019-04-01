Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845C2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5244D20850
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfDAK61 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:58:27 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42635 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfDAK60 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:58:26 -0400
Received: by mail-vk1-f196.google.com with SMTP id 195so1976557vkx.9;
        Mon, 01 Apr 2019 03:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WtwPw66PLIaHPchYksLJQCL1nfU+nly9QYX8ufO2a/4=;
        b=oHQOqRROb4rA8k+SQ64q7UnVN78j8DsivKf+xpDeuUDoD5yxw7A0w0LZwWf05pFIo0
         cfdkdo+iy1W382WkdxK9xu+2vXTH93iT8JrFEhwUSRXbRChMsS/vtIQeqL9kNtT5gzay
         knIDzTMAlikrNi+hVDf7WMmT3nMZIdfARiUech3hrJaqAKoTN9lfiIy5v+X+zsrEuuQV
         qlFrvz50zsOjfHP8gecaK51A9p/AOy35ja+aBW6b53Saa585lw+vMdDQtMbf0nLbzPa0
         +9LPEbOvINMvMYKwAl/+X42J+W9DRknYCRSVt50F7q+YKkpbqZyz4xAfUwXDZMNyuZFf
         w8Nw==
X-Gm-Message-State: APjAAAVKl70GmW4y8bE8TnjltJGH08QM93ymvNaCwvcj9y3f+GyNrGjM
        hHJssqrgPZxzYTuZKEG938uYNYnBg4V2h+H+s/D1xQ==
X-Google-Smtp-Source: APXvYqyV+fO/a+t0ExLNymPDOwoRJQ7fuSBA/CmjQ2bFEtN2q1B3Q+RTLEbTD4mTNiCSyQjd+qhUZytosqlv5zIQhTA=
X-Received: by 2002:a1f:711:: with SMTP id 17mr38138542vkh.65.1554116305667;
 Mon, 01 Apr 2019 03:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-5-geert+renesas@glider.be> <20190401101425.5w7ueezlsat3fncz@verge.net.au>
 <20190401102551.wwznt2qnnccsx2u6@verge.net.au>
In-Reply-To: <20190401102551.wwznt2qnnccsx2u6@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Apr 2019 12:58:13 +0200
Message-ID: <CAMuHMdV8h4pO7kLKnKnkGAZc_1GD1PVOEZk+bBqNA54GQGkwcA@mail.gmail.com>
Subject: Re: [PATCH 4/8] pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins,
 groups, and functions
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Apr 1, 2019 at 12:25 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Apr 01, 2019 at 12:14:26PM +0200, Simon Horman wrote:
> > On Fri, Mar 29, 2019 at 04:29:38PM +0100, Geert Uytterhoeven wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > This reverts commit 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> > >
> > > The HDMI CEC function is not supported by the R-Car Gen3 Hardware Manual
> > > Rev 1.00. Therefore, delete the corresponding pin groups and functions,
> > > and rename the HDMI[01]_CEC definitions to match their GPIO
> > > functionality.
> > >
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > [geert: Squashed several commits]
> >
> > Ok, but it now does a lot more than revert
> > 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> > That confused me a bit.

Sorry, I forgot to remove that line when squashing the commits.
Will fix when queuing.

> That notwithstanding,
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
