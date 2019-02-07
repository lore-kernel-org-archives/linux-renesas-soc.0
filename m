Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE24C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F2932084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfBGKNe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:13:34 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:36012 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfBGKNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:13:34 -0500
Received: by mail-vk1-f195.google.com with SMTP id m13so181330vkk.3;
        Thu, 07 Feb 2019 02:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iWSvMVOE6soCYc+iJXgZHPMJH3C5o7q622mRNi6GuXM=;
        b=TbfVVjAA4Ao5UjxbWsVskOzQLb13IfBYyGMr8CJQiDcaTrMtzdmCskrH5mCfxY2Zz9
         TpGPY3LXeGOg9b3FgiRItAsNAdwQ7K0aA1xUe/1MJFJgX6j0vFT9+ot4Agvr+qtdxLp2
         qZCTYDlbJRMnbRpA1I0K5hIm+eJ8Oo8u7GJ0vwR1mLIwebYFiXb3wtTvHe8gu+P/TO5m
         2uGJaQFJwWhxsAetSatSUTAi3ABQDHsS+ZkOBAnMtCT8L60MEC80Havn1cK6rUn2P4vA
         dBMjf+bvbBs4DvqiutKYqR+F0rJINx94Pcu+bKEddXCuXBkvCu9xzzWpmlv9T6NIHc1t
         1mUg==
X-Gm-Message-State: AHQUAuZZwjTdLJGEN1E+fLFrb61KaFRkUpXm0Pj8n7R7OWxCxmJJPG5P
        vs3cp4+yrIq4DrGjl358GCr9zsr+9zZZTKuCuXc=
X-Google-Smtp-Source: AHgI3IblriqQeS8Fz+eyS7yqp5binIUD8+pACgPI3sznSkR6d34jzTuZ6ahWebEdYeQO0P/NbfrxMxz7BkeCkXS+9A8=
X-Received: by 2002:a1f:8614:: with SMTP id i20mr2874511vkd.74.1549534413049;
 Thu, 07 Feb 2019 02:13:33 -0800 (PST)
MIME-Version: 1.0
References: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com> <1549528310-54436-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549528310-54436-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Feb 2019 11:13:21 +0100
Message-ID: <CAMuHMdVzg3TqqPzknvpd9ONDdqgsM_fVe8LzbO_MjNdLvmCLXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: cat875: Enable PCIe support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 7, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables PCIEC0 PCI express controller on the sub board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
