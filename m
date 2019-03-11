Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD30C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19D972075C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfCKJuG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:50:06 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46305 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfCKJuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 05:50:06 -0400
Received: by mail-vs1-f65.google.com with SMTP id b17so2276361vsr.13;
        Mon, 11 Mar 2019 02:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcRpGn/p7GMZlKthm1k13h/YGWGqIvowHm7bL8Gdsos=;
        b=HZvwjEQw2hBU5ysiZCHmfwum0o3zVubuTiMcCPYdtQhpm7MElrOWot8Xu7lGxAFQfk
         5A5NCgjjg4PCC5QkzOxo1Kw4W6fsQ+VwWtlqZM0dDVvu0omUKVNu+nqK+5sx/E+3LOvz
         lrAnuk7kQ+al2TbpB+e6AJpIPmb1TQXR24EgTDL+hdM4phBKbBNZJfuEhHfagLCk0eCj
         ayu7G10ezrDHNJRSDI3xELQ7vA6iLRy1DhGuXNHiyK9q7PfVnhf59N4j6k2PK7R6kIZj
         yMZ2pTDSHbOPv60V4UDqJSOUQ3kxFM9VQ3lUcN6Ww9M0G+2cFgs4uCt+JHWFZ7h6s1kU
         APzA==
X-Gm-Message-State: APjAAAUW+2b+FOnBK76glzmNkndlQzS9BLINyHp0tS3BcTRTXdj9U1ml
        7aClWj+sIBDI+QEfUULCVdXqIwUe0Jc2AADHPHY=
X-Google-Smtp-Source: APXvYqwHksmaysUV2CmEtxcdA1Ie/8oIb7MdrhK+u4LSg+YNAFKxXQUXRnThvkaolV/Kihdk8SpxtFzpuwD2feEG56Q=
X-Received: by 2002:a67:8588:: with SMTP id h130mr15458823vsd.11.1552297805720;
 Mon, 11 Mar 2019 02:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com> <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:49:54 +0100
Message-ID: <CAMuHMdVwgcFXqB2WSHGO3U=bf5pE6qD+XNa+p+c88_EG4+umDA@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 5, 2019 at 7:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Use a macro for the hardcoded value and apply a build check. If it is
> not met, the driver logic will not work anymore.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
