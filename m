Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F64CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59F9120828
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfCSK5N (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:57:13 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:40456 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfCSK5N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 06:57:13 -0400
Received: by mail-vk1-f193.google.com with SMTP id l17so4517138vke.7;
        Tue, 19 Mar 2019 03:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAswVV/nrNFeW4Hp257FXnKUyhnLA8mD9wwrzBdVwIQ=;
        b=Z0kj7yHi9l8VpZ5WMXxlcADzvs1fuSMdT1hIjYBP94VGxX35hvwRexlMcMF0xhYE5U
         Y7CHW+boXwH5ZiV3GD7QhomnINXMta6eGrXhcFIF4CVtf9pZDoxDqvzvx+ZpT8lSWf2c
         c6yCEHysjp5unxNjJlRVArsS4gIVvnX9A/vldsRGnv36MG/VNIiswTtwtrOv7U1ee44n
         NyJCaLb2ji6cJstbGua54G6YXYIgD4tAFEFgSJA7gMoGkAiGKHzDul7p8+BbxfzXBaOe
         ViOB2PlyRYwAXchiHMOeemDxe+TtxyohvP0kJvzd2sltbzAq4V3LJ97WHm+HSPLRMPAi
         8RLA==
X-Gm-Message-State: APjAAAU2EVCWfNWXDyEmfypoVrBccTOMvRTRFDsk37xMvfNfeG/Hf3ri
        nXDQjTnaEJIbHzUjjUcXMSpIeGOKlkxSc63MuNQ=
X-Google-Smtp-Source: APXvYqxA5j9tFmsh3ywdO10sFuAKWrDvV66jB4h/d+x77uAS3L/5+XUxEsYH4nJoq6kx+aSxfAbEklVAo92KfnHPibA=
X-Received: by 2002:a1f:95d5:: with SMTP id x204mr844438vkd.72.1552993032334;
 Tue, 19 Mar 2019 03:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 11:57:00 +0100
Message-ID: <CAMuHMdXSScr8q-pU-vtuZ81A9ZaObaLWX4awimsEgLVnxq=c_A@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 11:34 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The CBSY flag should be proper before calling tmio_mmc_host_probe()

set?

> because this function will already use write16 which checks this bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
