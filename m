Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2CEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 13:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00A3021A80
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 13:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfBONCk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 08:02:40 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34058 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394842AbfBONCk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 08:02:40 -0500
Received: by mail-ua1-f67.google.com with SMTP id a42so2713150uad.1;
        Fri, 15 Feb 2019 05:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Mtmf4WB4XOrKLFFnPepzq0C7fIWgpkFqozKc3+zlqI=;
        b=HwEjlEfeBev16mnLiW+iQnW0JnGY4YCc3vPFpuOt9dqUdS4oEQLUX41kiTiC12oOnY
         BcFOsZMSFbNOO+GaIPepio99zsNBKavVkVfDazVAIiKQZLSryrGvVGhj5svmv43ulV9+
         WUa8XUFe6HHu0j6y2clULwlZSrY/ks8NJ4UvDBgvyoBABHFnOzn1OGQjO8b82f67DydP
         SCH6yXdzb03+NP+Ij3Ea+rMtDW6hqpQrErN4FbOePH3+FKXxV7DGE/gIjKSozOLwGNUW
         bPXlSGEtiOwrb5jMjwwx1iW5AOgbD+pGCNP6Oa1nM9/0RLoBXuO52j/41qmF1soRCSD5
         eh3w==
X-Gm-Message-State: AHQUAuYWctIpoRue/a91Yy4THifGlZYNppdfpi4ibftcR2JG/ye97OTj
        +1KALE/VLLWxczlQuiE9ZWsW3ybxvamlBsEoxd0=
X-Google-Smtp-Source: AHgI3IZPU012ZNt702vpB+ITHpjj53hns2SZJXsBSiVm+pBzHyRyhH6+1zMVxKc1p38s5a3BUadWT1EqD9h1LCk9w8Q=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr4622582uad.78.1550235759161;
 Fri, 15 Feb 2019 05:02:39 -0800 (PST)
MIME-Version: 1.0
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Feb 2019 14:02:27 +0100
Message-ID: <CAMuHMdXXovDP-Ss2UvnXPVNGx5Tp=z9pwuWLJedfhN1GjaoS_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 15, 2019 at 1:26 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> We usually leave a space between "=" and the value of device
> tree properties, but unfortunately that was overlooked for the
> "clocks" property of cpu@0 and cpu@1.
> This patch fixes the spacing with the "clocks" property of
> cpu@0 and cpu@1.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
