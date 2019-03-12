Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 13:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 435BE214AE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 13:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfCLN4u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 09:56:50 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38332 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfCLN4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 09:56:50 -0400
Received: by mail-vs1-f65.google.com with SMTP id h132so1627448vsd.5;
        Tue, 12 Mar 2019 06:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOJjlm4HTvWGwROI5gKa6whSu2sRg/RLv/K/k0iGHwY=;
        b=n0vif/7/+Q+4NMX9xHvmSZf3pbN7nn7JLFRseDlpf1DGxHLMyREZZzatAvjIFVq1Kr
         GP2V5sOr3XBEJQ8D+VJsXPICiQjgOgZ+zixxZ5k7xGaAtRE4j7ApLOkn5LUc9hExvqba
         BRJnzLmv4w0QYzP4fuIUoP3bPgr0P/37GLpgIuj2GJZUgkve17Q/GSjDkcIi9xSyV5CA
         xJJKBew3P9H1o63l0xVLBJYxxLZwnfRNmQoMNFCbnikHxanebpUObVYcbrQC9/Qo2UOe
         0aSSgUycOZfnAdiWvAHHVuG0kQvbodMSAklc3NStQLb9g9DA20odN8ODAm9OyOwGNOjp
         KM2w==
X-Gm-Message-State: APjAAAX5BZNCmQPcbJ/U3IJZ2XRmksgQYlg8TM8DOqNUE+0ccL7LUkUB
        lF7J5Yt47L97YkqUeiqmoIWL+rG/TR4AY0yiEPc=
X-Google-Smtp-Source: APXvYqwC3yw9YdzNwGROhvL6xIeMlm3TUvf9KCh+FIAFfseYgVOPC11JgjCzYEp0KOwSenk6Qr+nCu79aHQIUiNWmcE=
X-Received: by 2002:a67:8588:: with SMTP id h130mr18986035vsd.11.1552399009686;
 Tue, 12 Mar 2019 06:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-4-wsa+renesas@sang-engineering.com> <CAMuHMdWtNiLcOB_0vTa2nNM+tkdiTfYWP=VAe3GsfjRbxkgYvg@mail.gmail.com>
 <20190312125038.6f55rmfmkkvimawg@ninjato> <CAMuHMdVYHxL-N+zurrP2hReMaWSShXWzOh5D3pSYHMq70W7Hsg@mail.gmail.com>
 <20190312131837.4jaqxe6t3xz5ccff@ninjato>
In-Reply-To: <20190312131837.4jaqxe6t3xz5ccff@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Mar 2019 14:56:37 +0100
Message-ID: <CAMuHMdVbY_gML=xoNyqnMW5MKXsK9P0tkcYfRGuTfkD_5RAC8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Mar 12, 2019 at 2:18 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Obviously I should work on improving my i2c-rcar foo ... ;-)
>
> There be dragons! ;)

Fortunately I've enjoyed "How to Train Your Dragon 3" with my girls last
weekend ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
