Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A208C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 08:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12B0420842
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 08:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfBYIa2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 03:30:28 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33915 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfBYIaS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 03:30:18 -0500
Received: by mail-ua1-f67.google.com with SMTP id a42so7599090uad.1;
        Mon, 25 Feb 2019 00:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdmGUY4uLgpV0u/Mfuop41CvkcPq5rZmsgGLV6VF8Bw=;
        b=J7Hc53niqGUjGa+lyAST9q3NA+AwJHFe0QW0NXgL64OR1YI/u2oIxr1g5uDwlQffdb
         hRq/r7cYisqdlKf9zFYD5Y9qKaTo7gRfLPzK51AP1zjM8m8HuIZKSxWYR9rxtUf/vLB6
         MgbRZXnkLxOxSQC6UIEsKt8DviBaYWsTspYWO/OlJIEAyFiz4NyUwF0DGMARlU2IjeZ9
         0YioPYGfTWFoRiIXrumsvPwA84Pl9sCy0k3H7kUEoeqyEo4nLkqTCOz4U2NvNw8cIq9+
         3CVCNBKPfTwTaW8e/ZGMAidZDYNjC9pRaVJjjyCiaM5+MmcEh6v4Enwi/8evGWcRoDvv
         X+3g==
X-Gm-Message-State: AHQUAubeOZyw1lJOIk2NCJ/cjQFndqyHp/x80tMxs97krbQmGJBM99rO
        yPPAowG8xQxdQ7aoTI4la/Zk2KFne+8V5X3xTSs=
X-Google-Smtp-Source: AHgI3IZVRSY1W8scTR8nCQkEuIgBnCo2njNMluQ59dD3HReyAtpAm/3ppMqaTqDz9tN6ftm+vc1dYt38gXdi3lQwCjg=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr8467362uab.75.1551083417229;
 Mon, 25 Feb 2019 00:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20190223223955.27823-1-marek.vasut@gmail.com>
In-Reply-To: <20190223223955.27823-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Feb 2019 09:30:05 +0100
Message-ID: <CAMuHMdUpNKubM1k4Qro08MDUf-ocagmi0UY7T4SKygGFkgjQDw@mail.gmail.com>
Subject: Re: [PATCH V3] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 23, 2019 at 11:40 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The TDSELCTRL register is responsible for configuring the SDHI/MMC clock
> return path delay and may be adjusted by the bootloader. Retain the value
> across suspend/resume to prevent hardware instability after resume.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-gpio@vger.kernel.org
> ---
> V2: Add D3 TDSELCTRL register
> V3: Wrap tdsel register into ioctrl regs

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
