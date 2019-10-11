Return-Path: <SRS0=35Fo=YE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CEBC47404
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Oct 2019 11:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAFB0206CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Oct 2019 11:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfJKLyF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Oct 2019 07:54:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46707 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfJKLyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 07:54:05 -0400
Received: by mail-ot1-f68.google.com with SMTP id 89so7673266oth.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2019 04:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ll+ZGZLXHxBCnVaZviDFpPP23aAB0ssHwz6UYY/uKEw=;
        b=GNz1bRCcdZLn4SHTj1KWMmn6fARLoAdR4hOPLMs675ypQZmeFCwIRVnfomJce8R1Vy
         L1PZ5eP+PqpxthqHOJX+OAg198CGxz+jGoW4XON9MWZjxqnie74copzLi7JB8+kMZhdk
         SRWm7C3+EhcULrZuR7oBQ/d/6jnlgz6NrzvteFjMUZdLOMz8w2w9aeevcz70DOZBR256
         8hdf0O6bJ5oxSP6tGuekzMVlqyoQL0CkDCp/ZNOaumGCva0WB6hSzm/Sj7ROAaBFn+0r
         W4iFucU0fFByBfuOAx8aTxkpTLjvRgeNQxuURRFpgkrTtnM4Han2jUdZac6mSvM+RUeS
         QKqA==
X-Gm-Message-State: APjAAAVSSD1Wfcu4CoR1lH7RQIJi02mAAgqA2Wy8/MAkNtEwlNRG2uxo
        oWIbF2teoW75a6qJIA3Kf2fkeQxF6ilBYWRGc1o=
X-Google-Smtp-Source: APXvYqyd37E9W+P4ICRfJCWfopf/DkWYboP0bWpZgr2QwLdeu5WNUJSM0qtuFjST13cShBxAMqE0EnR9MHuMIwxk1Hc=
X-Received: by 2002:a05:6830:1544:: with SMTP id l4mr4333161otp.297.1570794844722;
 Fri, 11 Oct 2019 04:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <1570437605-15804-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1570437605-15804-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 13:53:53 +0200
Message-ID: <CAMuHMdWdR8WNQXMFLwuQgj=NTD-ZeadLmOYkttmOX5BbB-7cXg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: add iommus into R-Car Gen3 sdhi/mmc nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 7, 2019 at 10:40 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds iommus properties into R-Car Gen3 SoCs'
> sdhi/mmc nodes.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
