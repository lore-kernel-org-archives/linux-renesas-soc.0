Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAE2C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C1C52087E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfA1PMR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 10:12:17 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:42183 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfA1PMR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 10:12:17 -0500
Received: by mail-vk1-f194.google.com with SMTP id y14so3732979vky.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 07:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LaWS8/GqOJCLlErkAfmP5eHLZl/bb5Pi4EzVD6jxTw=;
        b=Y02kZ2gB+vxQz7XkGONUGWLU35tdt1oABkR0oOyFujTU9duWnL9AkulZ8j0DHFZxhf
         QwkKHaliiw+UYckLk6IWwyM7VNLwDDURCNRncVt7msiNYiBQhs1zxrR3sl72HTcB/FeD
         vpMgp4rClCcrxvVzODW86nJzacxFyH/RqPyN616xYNkz54F9UqvE7Hy1sH2YesTyJUN4
         yWD7JdtccvQ4qyLAbwTzRIQkhQzEQKxmAq+BLTlYOxPlyN9BydLdLVXukLwc9x2TWufL
         vRoDnZmJQbSTCeWN1FOF++hZrVPklEPfllB51pqF21hI9NZSq/QF2xNp0Wtwa7lUBthe
         0+mw==
X-Gm-Message-State: AJcUukd+vB771E9y+M2p04xeL2wWS7D0ATBCwUj8AsoFJQHP9u7UBjl0
        PLTmjtk3rw0Hr9rZHAPQN0t9c30CEufRoFj/w9M=
X-Google-Smtp-Source: ALg8bN5yROmhXfPl7gRLbLk9EES4WA3XqV1vZdAs2oaqKJc7zluJex0FhoY/1eaFa2d/jbufrM/3P6v6wd2CtGXjZ2o=
X-Received: by 2002:a1f:91cb:: with SMTP id t194mr8846220vkd.74.1548688335910;
 Mon, 28 Jan 2019 07:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20190128140127.17540-1-horms+renesas@verge.net.au>
In-Reply-To: <20190128140127.17540-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jan 2019 16:12:03 +0100
Message-ID: <CAMuHMdUw6WjkykiCwK6_SYt+ktF-DkU+jczuoLuRh0-fKpVNwA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77990: Add Z2 clock
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jan 28, 2019 at 3:01 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Adds Z2 clock to CPG driver for the R-Car E3 (r8a77990) SoC.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -79,6 +79,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
>         DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
>
>         /* Core Clock Outputs */
> +       DEF_FIXED("z2",        R8A77990_CLK_Z2,    CLK_PLL0D4,     1, 1),

According to R-Car Gen3 Hardware User's Manual rev. 1.50, the SYS-CPU
Divider 2 is controlled through the Z2FC bit field in the Frequency
Control Register C. So it is not a fixed clock, unlike on R-Car D3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
