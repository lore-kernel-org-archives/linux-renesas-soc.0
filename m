Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF728C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A3B52084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfCKJqQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:46:16 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33081 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfCKJqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 05:46:16 -0400
Received: by mail-vs1-f65.google.com with SMTP id u13so2290669vsk.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 02:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G1pRqq/6ZZ9DzKr/wC6RDG6m+0XQxSrqMabp97hzN4k=;
        b=AwpoGIg7SPSRDH6hM3BkRVyoyx1YBaAy/PmQLx36h4xqelbFmDGrCkVXLf7yZZ1GTa
         NP9bAxasKhp2tQrkxNyHtA30FmyL09ZLXuCLgZmcVb98FrOma8hNWB3Oz82rB4W2FUxz
         zAqT1N09tpLLts1Ty8ED8tMxE3c7yqpgg1I8WztMza+g0F/1kDV4PpW9WzwTmFVEYdAj
         R/HyNtWsxfARazaoMNHxvHaGD3WI8ZwdFRExq4HLg3Wd4qljjFAuAdODweUL0H4S5BiX
         9cdlreTHQGok2H0/cx9Mfi+PiWYTqLNEjJaX5GFHIzFnDJXqAPnC/EmIyJn5Nk8vP3nE
         HFBw==
X-Gm-Message-State: APjAAAXfVJZI5n3+Wg3by096NKtl7TrMoF+vaWZr3WShY8MQYivXWRuT
        J6oSvJlh3A7GlH6VrF1ZoDQRtl/kRrJrnKbha9k=
X-Google-Smtp-Source: APXvYqzv7ubVduZUtald4TlDJSbe68xj60HuqbEPdwalyie9Qu19JcorYSy3TzIMErvAe/FzQXgYVTvTi+zAoIaUUn8=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr16455873vsp.166.1552297574925;
 Mon, 11 Mar 2019 02:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190309020642.15985-1-marek.vasut@gmail.com>
In-Reply-To: <20190309020642.15985-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:46:03 +0100
Message-ID: <CAMuHMdU+Av1JfGNRdQRP=DzxiesNsqNp05taKwjUouOGW_mp3w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Enable CAN0, CAN1
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Mar 9, 2019 at 3:06 AM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Enable both CAN0 and CAN1 controllers on R8A77995 Draak board,
> since they are available on connectors CN43, CN44 respectively.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!
I assume you have tested this with your CAN-analyzer?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
