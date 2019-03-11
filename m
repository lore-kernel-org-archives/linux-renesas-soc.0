Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DBDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A9E7206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfCKKAH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 06:00:07 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46891 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbfCKKAH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 06:00:07 -0400
Received: by mail-vs1-f68.google.com with SMTP id b17so2292022vsr.13;
        Mon, 11 Mar 2019 03:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FH6SBz3gLN3wYJ9bOUTVheAQD8HDIr9anxcpyDZvoo=;
        b=R9ce4rL4ndX0cJjElULh8uR5dmLZgYvh7VEYtU30Le7q8y2VVwhRbgDNDvuPw5vnds
         wIAej4vEpBZcOiMi345ViuEuOmOkp1hWU62qbm3XgZ4Lr1/EWbW4Xe2lLwA5RdcprFW/
         ZSuw8eAlVAr5T7MMDHT5Oe/YqOue4nTa05fKOvTrVDyQd+bIuChMEQAsYTJ7/U8ExG7/
         1F4MP+JSAK9WX74xkJ9ZFm/K06oTeIf7nUkbUFZcVksCtY9QO1NJPnFhg5qXX9OS0AMh
         XS331GEX/QQvohPY3Pg3quKbKlAaAV9GTNN0Hqi+2kqa0//G8ILqB0A8sMADDYikdtqV
         KCog==
X-Gm-Message-State: APjAAAU9A1Msp9h9JU9Tm+q2p1rvYQHhsU8bnhzLaPbPMYskD3Wx3GeO
        aoXIg0HucojKcgfplTmvsgJNZMtfoQoEFbb2h/c=
X-Google-Smtp-Source: APXvYqw8BFCz0Hn9/m9j5I3ZSFHBKyc5IfWPVx3s5Z6Vq2v+/ChJXMKmLn7jjmsiQOFAL64Yrzugc7sOwer62LAgOyA=
X-Received: by 2002:a67:8588:: with SMTP id h130mr15474798vsd.11.1552298405912;
 Mon, 11 Mar 2019 03:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:59:54 +0100
Message-ID: <CAMuHMdXx2zKaV1mEBh+br5=BPbCSi3HVa_dpjpz1ippSS_oN9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] i2c: rcar: make DMA more robust
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Mar 5, 2019 at 7:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The Renesas BSP has a patch to wait for the data register being empty before
> starting TX-DMA. This is according to the data sheet, so this small series does
> the same in patch 2 & 3. However, refactored, so there is less to compute and
> it is hopefully also easy to read. During that work, I noticed an implicit
> assumption about a required minimal DMA length. It is now explicit and
> documented :)
>
> Tested on a Renesas Salvator XS (R-Car M3N) and now regressions found when

no regressions? ;-)

> writing data with DMA.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
