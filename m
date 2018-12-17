Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C29DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5548920874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388088AbeLQQSC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:18:02 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38824 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388053AbeLQQSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:18:02 -0500
Received: by mail-vk1-f194.google.com with SMTP id w72so2960187vkd.5;
        Mon, 17 Dec 2018 08:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fAj2V0VznE/ELXzOW3dkMHEdwqdAJ+TvkvLDN4iwEC8=;
        b=MfkOPIU9PJdLPWs48g90Ua2xyEx2w0D1kMoRpZ3xEmSbC1+rt3ZLibaBFvfY4TmK1R
         WFXzrK7i4r27Y5n9GBlXCO72XK6VzoLy4dzhAgIPmX9ntGbLyhAtK1i3xE6MXvC8ruRw
         IAWKjRoMggWr7cllWkBdPJ2K6Bedg1d94k2m1ymrB+oGU93kDxEDcnOuknoMSpeqp/51
         DsgRND3ofklz4iCvxt11jvtfvdDetlZQf+IboY6yd4OGCqUdkWuHuyyIMr/TwYMbnXxD
         d1JSpRizeO/1jFjybCd0xeX4skWBRqczxnZDGmzi/YvSAxLb1w631vojRRTGdaI92+78
         x4jQ==
X-Gm-Message-State: AA+aEWYkXHvlKVsdqEjmacCIAblNX2yj0VDC/1quhcVm5+RGTTy234LZ
        /cUIuGgQvl3MqVAak03sSn6UGHxBsqF1pYGyWNjH3xQ4yZw=
X-Google-Smtp-Source: AFSGD/VrBBwee7DB5zrWxLSMKqCjRoSWmFsWANDUYvuTCoVW2CI6SNVctoILPBUhDKkZnc6K4vbxc+tVjiYRaZs0I/E=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr3916576vke.83.1545063481172;
 Mon, 17 Dec 2018 08:18:01 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-13-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-13-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:17:48 +0100
Message-ID: <CAMuHMdWGeF9fWAmb=NoWbTLf2DWxnXfRoN-sZ3W5XyGmDi2iiA@mail.gmail.com>
Subject: Re: [PATCH 12/17] arm64: dts: renesas: r8a774c0: Add USB3.0 device nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add usb3.0 host and function device nodes to the RZ/G2E SoC dtsi.
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
