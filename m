Return-Path: <SRS0=EBUn=UF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F42CC28D1D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 12:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 258262070B
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 12:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfFFM6V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 6 Jun 2019 08:58:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42537 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfFFM6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 08:58:21 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so1900213lje.9;
        Thu, 06 Jun 2019 05:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBy0uqYLg7tb6lXnY7rKhqnY0ryXj2jCTK4uIKivhHM=;
        b=q0wgh9LWXjIsQFZ/B0081zzhYT+h+3tdYSNNOc+OLaVnWJa3hqaksNXZXB+h/qgXof
         uo8E9m45veHAwvWKW1ujWI82en58mohDvVHPdukyZRVL03qmcgGIt6xjUo3MX9GT1R+e
         ZDe8MCa8GCz3onTmgPcPSibYcx00wS7J4BeCwGAxkIXj9hC6gE45fY7bafE/4IMfEEAj
         mwhXU19eqDvyMEI+x0tZm7itOC72QDZTS/k/BsoY9GVU27SFF0I3AzYnQZZ8wIL7Qjda
         VHjqGjVqeuWsfJ6gV1qcR/hw1SdNlfHx2AGSyPApqAk7nALDn9757HaeWcxnBSt2tntA
         TEFQ==
X-Gm-Message-State: APjAAAXttfyRhzI3CLFHv/RnBlPLBn27P4K2RZtWDoCvvgd++wYz9feY
        GmUG4j9/hkstO+B01esFWKV3oi5p2IN7fi0bf9M=
X-Google-Smtp-Source: APXvYqzaM2t/POqu2YKFpcfOMdGqu8YeuImRYPlPnr5/j6JcGKJrZNTMZfMarKZgZtAqkuUlq9oLac19bAuoe0yy59U=
X-Received: by 2002:a2e:2b8d:: with SMTP id r13mr12470277ljr.145.1559825899018;
 Thu, 06 Jun 2019 05:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com> <20190606113537.8869-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190606113537.8869-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 14:58:07 +0200
Message-ID: <CAMuHMdX+V9bZ4JDzTDZ3xVb_OpF2UhKbqPspcxW3YHzNM+e7QA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: sdhi: improve quirk descriptions
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 6, 2019 at 2:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Quirks show up in new SoCs as well, so the naming should be generic.
> Describe them by what they do.
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
