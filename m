Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056C1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D06C420823
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfCDKnR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:43:17 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39068 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfCDKnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:43:17 -0500
Received: by mail-ua1-f66.google.com with SMTP id s15so3961044uap.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2019 02:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRi6wWBaStgEcD9e3JWpCfZoScK1j5bBmXTpILlnVF4=;
        b=LBwOliVIobYMArVs9QC+u7OyWFSOnaKqQBDV5ozrJ8epdqBJ5Qv1/A7+1WT3DsAlZ/
         iY1HwQTYaVi0PfFHrLb5PHon958oR1a3HAF9Cu1r0X3Ub3kzBXRC1tZaUfT6IgnzR2tN
         RxmCymMV2WIiZpFMpktDFRIIbxmT33XJ43l5ZFLDAPEqZw4l6tOFLZxeFSfBGgogoPWH
         6PPLM305c51v3H3AjqjlF7nfQgkFblsfnv0/NG37l7V2MKNyQHWMivDHw4ZHV+oJfkRa
         priSumz0LEfsls/q52Xkps+Buoi7orwjpe2aSkdy5IZWhKDYMOh66PnRILCPCbU73JSg
         o+5g==
X-Gm-Message-State: APjAAAXApSclGyCEVV4hyNoR+kiA6LC97ZqKQO/YhlZVixQn0w/01sRW
        GeCYGFmXX/Kqyazz9PbzFNqXhoF2IJRXlBQ7XRs=
X-Google-Smtp-Source: APXvYqzEAZQCGvsTr2TGbGzgq5K9cb/lSKzE902fivLuKOKQFqnVC2wI92FzMjESZwlLwTQJpwOvbwIoCmfIVwRFDbM=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr9322010uao.20.1551696196208;
 Mon, 04 Mar 2019 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20190303194140.11757-1-marek.vasut@gmail.com>
In-Reply-To: <20190303194140.11757-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Mar 2019 11:43:04 +0100
Message-ID: <CAMuHMdX+rm56cMo50SuYw+3qUePjmu-rkXZs7vvZEgEsLcUeoQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 3, 2019 at 8:41 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Porter needs the regulator quirk, just like the other boards.
> But unlike the other boards, the Porter uses DA9063L, which
> is at 0x5a. Otherwise, DA9063L and DA9210 IRQ line is still
> connected to CPU IRQ2 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
