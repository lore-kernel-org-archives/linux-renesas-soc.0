Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F537C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F6D72177E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfCMMRn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 08:17:43 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38829 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfCMMRm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 08:17:42 -0400
Received: by mail-vs1-f65.google.com with SMTP id h132so852250vsd.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 05:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pvovDo9+kjSbZ15G1xTpx2pIasa254LaHCel/y1JBZs=;
        b=OR6apaJmm7ZHCZDYzM+x9gP37RD0OWHudwsJ5OTYeCtcMghtFeG6RkoaKURfafPIzM
         7jc+h2qSu1R+oKhKE72nb+lGrkUpRNIkVQkIWG47OlgdlLOJxFahAvInBloWs1K7MnVz
         9TpYj4BIYbsIz2uJi6Febf2Z4IGgzZSYqF0coETn+9dQbUkNpjYzAS9nUMvrPF2g8yeb
         GVts0a1wmjVJTgCZItQDV1PqugYGnnuxfl9q15JdaS26hKJu+8iv3u//Jknh4F0BB02Q
         X0VizxAfMnI6LWYx2EbgeNfniGoEgQ1wLGZkSH7M3NZy7U56o/ns6WtWw1w9zwB9VALA
         DylQ==
X-Gm-Message-State: APjAAAVkiECBvtJ84wfjtFNffTSzPdFvolLeN88hff/8XHHcGtmEj1kO
        YyYnv7kog1FZrJHlWzIIbJctb9MK4zui3Vo+d8M=
X-Google-Smtp-Source: APXvYqxdGv9pOiK6gGKF9JUuGCCPRD5oURx71tLx/+qwpxNhDoGVOvo7HQ2BF60wVtwNceybaivo2iv1rh9MzRYwNFs=
X-Received: by 2002:a67:8588:: with SMTP id h130mr21589096vsd.11.1552479461669;
 Wed, 13 Mar 2019 05:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190313105816.8592-1-horms+renesas@verge.net.au> <20190313105816.8592-3-horms+renesas@verge.net.au>
In-Reply-To: <20190313105816.8592-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Mar 2019 13:17:30 +0100
Message-ID: <CAMuHMdXAFf_bcpn0zo+Wx+5f3C1TbgTY_jucmqH71mcmn11f-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup
 Power config
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 11:58 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> On Ebisu the DDR0 power rail needs to be kept powered when backup mode is
> enabled.  Reflect this in the "rohm,ddr-backup-power" property for the
> BD9571MWV PMIC node.
>
> The accessory power switch (SW23) is a toggle switch, hence specify
> "rohm,rstbmode-level".
>
> Based on advice from Geert Uytterhoeven.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
