Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AB0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0196C2171F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbfABKpu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 05:45:50 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:35255 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbfABKpu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 05:45:50 -0500
Received: by mail-vk1-f193.google.com with SMTP id b18so6479705vke.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Jan 2019 02:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awM+1MIONbir+czdxrqyS1TXHcOMBg4YF74JgvwZLX0=;
        b=e3spUa+pmRywZCl/JaQM04LgpKCvTNpBorGUv5Zm/ZOiwjGOwwcrTF/G4GFLhOfHIn
         KhDKU8MJh6LqBaNB0Vh2kXP8Xe1GHYRacjYVIJpci3nuo793jWqcYvIX7HhlmjUVUTFM
         z4XFBtsJoqUpacDYcCQHrdeblgjebweVzpfUFt7nFt3EXXCJDwZqB3dmDlPhGebJWkdp
         AZeIUo6xjx3k0sIrJC4OEGW9Hs/VZ6Glbass3LIj02R1ntiY/UNM7CzDNPG9fvXIChZj
         jDOjIsUUvOZaJu3WUM9y4pco8XNHECoPVCT3ND8n9CqOuDqPOKxL4wtVQStSgIkiBUNl
         U2yw==
X-Gm-Message-State: AJcUukfKR29oESBxig5VbaHdk+LA+EAVGaxEG3ioQ9/codlzZeCzJBHc
        NNjOQkVgKweEtIcBBgHLHHgsW4bXOsNPmX0PfTwD0419wZA=
X-Google-Smtp-Source: ALg8bN7OYBwFPd/csy3iOCTMz/bPfbWowFS5jL1K5rqgOgdeAr+MHIVD3qEdYKeavL+RyehW7rtDanqr6WBskG/1AwU=
X-Received: by 2002:a1f:2ed7:: with SMTP id u206mr15186748vku.72.1546425949147;
 Wed, 02 Jan 2019 02:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20190102095154.25839-1-horms+renesas@verge.net.au>
In-Reply-To: <20190102095154.25839-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Jan 2019 11:45:37 +0100
Message-ID: <CAMuHMdU=aR8mSwd876LV=DG_vh6Bx45zxRTfMXuX3BQpy0M=ow@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 2, 2019 at 10:53 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> Enable the R-Car thermal driver as a built-in.
>
> This driver is used in conjunction with the R-Car V3M (r8a77970),
> E3 (r8a77990) and D3 (r8a77995) SoCs.

> [v2] Enable as a built-in rather than a module as this seems
>      safer from the point of view of protecting equipment from
>      overheating.

Shouldn't the above paragraph be moved below the ---?

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
