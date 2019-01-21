Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2FDC2F3A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:31:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 318C62085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbfAUMbS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:31:18 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33200 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfAUMbS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:31:18 -0500
Received: by mail-vs1-f65.google.com with SMTP id p74so12516659vsc.0;
        Mon, 21 Jan 2019 04:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAMdSQ+Njfr8LMpQaUQeMdwtHJpmB0iIw3dGEdV8CMg=;
        b=MM1pmQqQt3CObvdXAg7E85o8YwpiIXmZULyz9Uc/kmZduh95IwkXU46GtFPaeYRD4D
         BtqxnKnupgqM0azA27zYSSPuo4WAFkhg9bvNpD5//+2VyikNGu1/j2JJfcrscRSmYxFz
         VTSpVZQhrpPbg+jDaupFQuOxYjqgrtg+jlrvXRM/aiz7YKxlMoJMbTbeUY7TazpGLPD3
         qgzAFcJ5HtoplKeG567je25pzmcvNcNldUdRKJszCqkD00XXl/urrPd3IqsT3BHW1QPM
         5M3gED1nNae28C6p1iBe8T8tMn24tDTvkWV+zkyDPJLVgRSlldnYEi7NqzdeT4tqdoia
         BlnQ==
X-Gm-Message-State: AJcUukcWojFyP4iJJ6PbwWK9vZAlVlObYnEPJWxE9llPUOjx55sAI33P
        PA18y9hey4bfjQnYMlrmJH3HQ999vnfB0ZfVqAY=
X-Google-Smtp-Source: ALg8bN76eyLPO6+4t+0qhsUuHHNTWVyhlBOQ8KfgMuPyEvsauoc1jgyzKCHrPksZnmBRtz38sU4vVYikOoA2QZ6qqdQ=
X-Received: by 2002:a67:c202:: with SMTP id i2mr11767018vsj.11.1548073876863;
 Mon, 21 Jan 2019 04:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20190111124517.2730-1-geert+renesas@glider.be> <20190111141124.nrwed7znrapo45wq@verge.net.au>
In-Reply-To: <20190111141124.nrwed7znrapo45wq@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 13:31:04 +0100
Message-ID: <CAMuHMdUjfRpOPgbzuWq7qjCuzmOCnpvJuiEKnc_Cg8Wi9ySmug@mail.gmail.com>
Subject: Re: [PATCH/RFC] pinctrl: sh-pfc: r8a7791: Fix VIN1 versioned groups
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 3:11 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 11, 2019 at 01:45:17PM +0100, Geert Uytterhoeven wrote:
> > The naming of the "b" versions of the VIN1 pin groups is a bit odd, in
> > that the "_b" appears in the middle of the names, instead of as a
> > suffix.
> >
> > Increase consistency with other SoCs by making R-Car M2-W and M2-N, and
> > RZ/G1M and RZ/G1N, use the recently added optional "version" argument of
> > the VIN_DATA_PIN_GROUP() macro.
> >
> > Note that this breaks backwards compatibility with existing DTBs, but
> > there are no upstream users of the "vin1_b_*" names.
> >
> > Fixes: 8e32c9671f84acd8 ("pinctrl: sh-pfc: r8a7791: Add VIN pins")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Is it worth making this change?
> > If yes, should we retain backwards-compatibility using e.g. the patch
> > below, increasing kernel size by 380 bytes?
> >
> > Note that unlike the deprecated "avb_mdc" pin groups on R-Car Gen3, the
> > "vin1_b_*" groups never had upstream users, so I'm inclined not to care
> > about backwards compatibility.
>
> That sounds fine to me.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queuing in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
