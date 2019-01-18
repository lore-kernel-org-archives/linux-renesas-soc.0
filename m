Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FB0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 11:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30B612086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 11:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfARL7J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 06:59:09 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:42717 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfARL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 06:59:08 -0500
Received: by mail-vk1-f193.google.com with SMTP id y14so2996334vky.9;
        Fri, 18 Jan 2019 03:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qdHa8O1fe88bEipNxbVt8LZe+YWxrjntCEAsIK/IToo=;
        b=VAvx4lXV8rUwaycmct2+Op84LpbgLDxpJfUhosLSSgtoCzzEGb9ZtPz0tqj3lw51RM
         McJpjRvFZRIxPLg444NWJEEgYBXxf+a1POKpbve2v0493rvPtATUTUG95atdknoBUuXx
         Nxv0qt7a6pSwWKWiNnm/MBgF6SDLUcKSPk29mWDoLO8TkNF20fVljWeQbR5JCh/PPGwX
         LjmExST9t39tzAd8/bF3LTG4/e1VuJAdsU+oWpvhwHCUgWke5bkdJHsMt8IR4SlWnBBC
         n/UqZazjCN9jpie5orT/FelRomN2QTr5DhLDrBHLXxzwjDEVADbDuJMAqc9Q0ppFdlpm
         dsyQ==
X-Gm-Message-State: AJcUuke2JVYv0M2BLmQ3lEdAuoGdCk1xH/tE9QfT6f8BJlkF7EKm3zxv
        CWbfS8+/2vq2oHl1m6ZohML6pzr8ig9F+2CimfM=
X-Google-Smtp-Source: ALg8bN7ex0wG29NBv+MQW5UrzG/rdzkD/pCNPjY9TBRjdtc7GPR3CK+e9HotX10TfbfXweT9ejwEmwwgmXU/3LCRcXA=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr7089303vkd.74.1547812747403;
 Fri, 18 Jan 2019 03:59:07 -0800 (PST)
MIME-Version: 1.0
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu> <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 12:58:55 +0100
Message-ID: <CAMuHMdUw0HHFhqYikL_YBHWhbC-FUOfA-EGFvY29b5SPOLLWwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Based on Rev. 1.00 of the R-Car H1 datasheet.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for the update!

> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi

> +       hscif1: serial@ffe49000 {
> +               compatible = "renesas,hscif-r8a7779",
> +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> +               reg = <0xffe49000 96>;
> +               interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF1,

Missing closing ">".

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
