Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE0EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC8A320675
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 12:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbeLRMHc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 07:07:32 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33973 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbeLRMHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 07:07:32 -0500
Received: by mail-ua1-f68.google.com with SMTP id z23so5629913uam.1;
        Tue, 18 Dec 2018 04:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soM6nlRQnRWSaQVfWboEpJlm76bO19slQxMVGUx38r8=;
        b=CJoqTOAznbiAZTyfypvkVgTQETi6VMDYTmr/aFrLOmXuwEnVa+36mnEoiYaf0PfOCq
         meJrpMz4xsXvrie5+C8e552+fxxa17gPKCZ+tNf60etQ5+qG337UVsMd6GIutBEGOA2V
         6UfXocHwgOA+A3o3zb+geW2Y776Shz2alC819Nu/cgJfbiRFHfGmZ7ynoN4jilt6Vqlo
         fr9OIVUtb8qt3HQvvP+qRJOTkxCIlz5EO2TYQRqcDtk43GLmHjLpuQGY9llXvpum62pX
         wbBGNZf1FlBNCl9Vs7lyPJJ/H4obdDx+Dte9JtbugNiHkMqqnXAfV9oiWS2JxRae6vIu
         E0Wg==
X-Gm-Message-State: AA+aEWbtPYLBmF9FmrlHbKUC/VrrxnZy6442hUzQkSecrJi50gpHLBcF
        6HrGJuIj5eSv3g3jXmme859Az+62p9IAKKi4skc=
X-Google-Smtp-Source: AFSGD/X+wjPXdUl1B4mk4wz65io709WfZ0reH+C6TlSnrdR8df8cLrznbY/EekwDPL/J2gss8ax5ECv7bfM6II1WPKU=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr7413214uad.78.1545134851158;
 Tue, 18 Dec 2018 04:07:31 -0800 (PST)
MIME-Version: 1.0
References: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 13:07:19 +0100
Message-ID: <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Fix hsusb reg size
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 1:02 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> HS-USB has registers outside the currently specified memory area,
> therefore change the definition accordingly.
>
> Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and
> HSUSB device nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
