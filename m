Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA12C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:16:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72429229C6
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLGIQE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 03:16:04 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41358 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgLGIQD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 03:16:03 -0500
Received: by mail-oi1-f196.google.com with SMTP id 15so3339402oix.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Dec 2020 00:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9KE6NyFNEZU3d8Y2IOOJNHxklbUFPSawLkFJ0IvFZs=;
        b=a4/ZBO/fABctJuhy6aegJnh6IhY3suB4R2rbAP4vrkL7kKsR6TzRzub2LhFgOIRFj1
         FpKOXGLvtMqQ8+3Xddka90qV/9l6zWCNFJHe17gX1bpr7w8purrzwP9X8I3as4l5NDm0
         DR5J5226YG0Bn1yc/NKItrHLrkt1WazXmjh0A4+AuycC3Qg9xs2LjEFKZbOc+es/nDPK
         hPM9/ExiS/kK/nDfnMnadCwI3CAbPvMy0BfEDymLUwfcIfsyjvE4c+DJgVxCluDQkPOT
         9s8S5rXTECjylzqaETttiBEMcGETt0ZRZRvIRomYoXU/squcwnmwEPKpWmSrXunAXcem
         ftUQ==
X-Gm-Message-State: AOAM532a+rvcjPCcE1RayOkO7GHA+NLExYSGnAzrRAc8E4A4mWDFdUz6
        y+gv0i4gip7etXHcVAD7mF7/mz/kRQciNQQNRWinHDmO
X-Google-Smtp-Source: ABdhPJyHqGB/MfqU2tuwSgI2DjUPWlVmiDjm9GeNsV0cy3iUwtbQKTAfmYrBjlKDl3fpjoRaygIR1/316iZg18+RjbE=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr10026212oib.54.1607328922988;
 Mon, 07 Dec 2020 00:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com> <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Dec 2020 09:15:11 +0100
Message-ID: <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Dec 4, 2020 at 11:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> generate a clock for the corresponding CRTC, used even when the CRTC
> output to a non-LVDS port. This mechanism is supported by the driver,
> but the implementation is broken in dual-link LVDS mode. In that case,
> the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> access its bridge later on.
>
> Fix this by storing bridge pointers internally instead of retrieving
> them from the encoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

I think this warrants a Fixes tag, to assist the stable team in backporting
this fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
