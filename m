Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B54C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43E1E20675
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbeLQQOU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:14:20 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40148 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbeLQQOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:14:19 -0500
Received: by mail-ua1-f66.google.com with SMTP id n7so4614871uao.7;
        Mon, 17 Dec 2018 08:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8x+IJVk64BAQPXXynNW0H3br988on2Youj66MurEXLk=;
        b=QrkQ+m3IOptQvHaSI/VsFVzMo108bX9j57V6S8lDhPx5NO1yvLhoJg9JiJr9+DZHDr
         eo7hhf+l/OOvLgjbgVl/xKz/cIFKfzdWmcoPDLWvPfcQk150t3MjAUyfx/y9Pio6IiA7
         SKTvjKkan6VqyroRIPc2oQoewTztQRy/8LWvraYud7/SB69bSO7MsttNOtC6WNC+ExHJ
         tf37tZPU2CN7ZrubTkovDrJhTvTZjrdCm6MPmn3GHHFzpSIpJr2fkuLXVca1EvfH4VLm
         Q4UvvjldAXRHOZz0Esxscc1QY/i720ElesEpmYrwzXLP/agoZxhNxEox7oZL0XCBVkr+
         Aa5Q==
X-Gm-Message-State: AA+aEWZwsnbtvAvcIXBQi4ur/90P6iqX7fzBrQWFX0a7OrL94Hew9yrc
        vrmoxXeZ3s2N7HdoQx5OvTWG+69ukUm3So3PiFs=
X-Google-Smtp-Source: AFSGD/VAFHwBSAIqetXtP0XiCOS/iQRx+7NdbCFMP3o43YN7G9NYC3MI5HVnyKw4/ZL9fP/RO1v+h+3xC862qDDR8w8=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr6044248uad.78.1545063258606;
 Mon, 17 Dec 2018 08:14:18 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:14:06 +0100
Message-ID: <CAMuHMdW651sgxiMfqcTFG7FjP2L-5154mLLDuXFgMxwQWUwUeA@mail.gmail.com>
Subject: Re: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
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
> Add the device nodes for all MSIOF SPI controllers on RZ/G2E SoC.
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
