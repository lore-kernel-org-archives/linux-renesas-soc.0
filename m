Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3957C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCF3B20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbeLQOXl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:23:41 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34253 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbeLQOXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:23:41 -0500
Received: by mail-vs1-f65.google.com with SMTP id y27so7801527vsi.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 06:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWFdQGsWAwEpmwz3etang4qa/q2f5u7avcygfgA48Ms=;
        b=WOcf4fOp2GRdl8kdMD0Q39zyzK0HbzixjWIfH3EGBTT8VJ5ZdXvGpRHeLLAsiQaS9r
         Q/aAwNW+y3zB1UuljxxDKgqcmA3rF7jmllhIWjD/78tfSq1i5DhaejO/AmTuHbBKjcUS
         U3to9aQ/BW78lIbm94ftf4g2ujF8IbhUh2X8qB7QVGasIW0rJxxo+VTcH3CpO0HIDc+l
         e2gdh7EVPA0oTyNCyEQ6rzYuf48y57xF5OArJAVwYFc4j1YUBw5Lcq7Ki3Qlo7I6j771
         UaBENnWu3MagSUNUBuUI4xxlnWl91Auu5dlkxCUp6si0QCeAA8XE9+DFJmW61GuffHyq
         ECug==
X-Gm-Message-State: AA+aEWY58iOovdkwtZMgCnK0pLNoMWkVjFbn6NtcFffMs8U6xn6U4xeY
        UTFxFGB/HFqY4mKL3sSMjiAWQGX1pnXWZ0UwYpooLJ2RExM=
X-Google-Smtp-Source: AFSGD/W+IsBbGcf5VWlHEb1L7HVzKePKnrZagSaCvPJToYeAq5KpMMGWeNf7EzHT83Nqu2IiSyU+E50jVm4wZUizrAg=
X-Received: by 2002:a67:c202:: with SMTP id i2mr5880105vsj.11.1545056620259;
 Mon, 17 Dec 2018 06:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20181212105435.28310-1-horms+renesas@verge.net.au>
In-Reply-To: <20181212105435.28310-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 15:23:27 +0100
Message-ID: <CAMuHMdVoJSxOJ4X1_nF8qG-g9EgCYLKUhuqHyJ65J3rjhiqq7w@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Add missing dts files to MAINTAINERS
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Dec 12, 2018 at 11:55 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add some more patterns to the ARM/SHMOBILE ARM ARCHITECTURE
> section of MAINTAINERS to complete the list of maintained dts files.
>
> As of writing dts files covered are:
> * arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
> * arch/arm/boot/dts/iwg20d-q7-common.dtsi
> * arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2075,6 +2075,8 @@ Q:        http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>  S:     Supported
>  F:     arch/arm/boot/dts/emev2*
> +F:     arch/arm/boot/dts/gr-peach*
> +F:     arch/arm/boot/dts/iwg20d-q7*

I had hoped to make this more future-proof by shortening the string, but
apparently there are non-Renesas iwg2* boards.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
