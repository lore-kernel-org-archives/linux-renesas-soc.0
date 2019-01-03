Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17836C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 13:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2B7B21479
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 13:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbfACNrV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 08:47:21 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41917 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730324AbfACNrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 08:47:21 -0500
Received: by mail-ua1-f65.google.com with SMTP id z24so10932031ual.8;
        Thu, 03 Jan 2019 05:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUqc0ZAHNRrpnuzACV7V/Usq50qIQNcQMtat7Sf+2w8=;
        b=kpdhEJKNVAbOQhCZJMTNgy0NtE3qV8M7uAQdOw6lJpPWUkxioa5Y0ocWMK++nxHQjT
         kcqhdL3+rfdo1h7fPmqmnmPamRIUzgI+JwlFTpTDKrUzLwvcs8r9Hd744Ult63k4TfUb
         TNszPhtbckgZv8u16LNne2CA0kA8z0opgWDDHj/bOFfczGRh6+NquhN2Fb9zz4JMtPjb
         h/bADW3srQrNgBhwFmwDnC0oUm8r4l2CA4T34gVBQOgH9n6QcHyt5AhJ8btNuy2V9mbs
         Qi4HowfsYLhft/IykpKJ205UXtkSXWCRzoY1eLoFA/czsJXqezcvSBeZvOpi4MpkpKs/
         qmvg==
X-Gm-Message-State: AJcUukcuDwOa0aOagqJoUvQmKW05GTNiXdSubaxqfDwBRgK4MnaaTBcC
        2WgmWTNbD7a5Z8OY6Cbmj4s4mjiB4O5K+irhNeI=
X-Google-Smtp-Source: ALg8bN6aByGha81eOBKWewJ3KY67axW5WV1F6yMquQyBuL0AfixobV6+QRlJ+TciYGeiRXJCBph8V2EyJBIxVpXRrgA=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr16486126uad.78.1546523239865;
 Thu, 03 Jan 2019 05:47:19 -0800 (PST)
MIME-Version: 1.0
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com> <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Jan 2019 14:47:08 +0100
Message-ID: <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du node
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com> wrote:
> The internal LVDS encoder now has DT bindings separate from the DU.
> So remove it from du node.
>
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> ---
> V1-->V2
>         * Removed LVDS encoder definition from DU node.

Shouldn't you add a new node for the LVDS encoder?

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 3cc33f7..3ad1efc 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -1681,15 +1681,12 @@
>
>                 du: display@feb00000 {
>                         compatible = "renesas,du-r8a7743";
> -                       reg = <0 0xfeb00000 0 0x40000>,
> -                             <0 0xfeb90000 0 0x1c>;
> -                       reg-names = "du", "lvds.0";
> +                       reg = <0 0xfeb00000 0 0x40000>;
>                         interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 724>,
> -                                <&cpg CPG_MOD 723>,
> -                                <&cpg CPG_MOD 726>;
> -                       clock-names = "du.0", "du.1", "lvds.0";
> +                                <&cpg CPG_MOD 723>;
> +                       clock-names = "du.0", "du.1";
>                         status = "disabled";
>
>                         ports {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
