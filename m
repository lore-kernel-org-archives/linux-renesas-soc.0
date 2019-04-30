Return-Path: <SRS0=CTUA=TA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50198C43219
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 30 Apr 2019 13:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2936C21670
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 30 Apr 2019 13:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfD3NAS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 30 Apr 2019 09:00:18 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44196 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:00:18 -0400
Received: by mail-vs1-f65.google.com with SMTP id j184so7876666vsd.11;
        Tue, 30 Apr 2019 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T8U8S6W9pYgH58gcHzi6vucbqWLIJbM/uYt3aM3LSaY=;
        b=JoAXtxBiVcfeVKlcf4olgIzDBaVKLom18pdilHXIDCTa/MuSk3KZjluP79Q6gJgmxr
         6UJ00u+DhRyqFl/1ItVmlmOi6i+/wZMjd1krXkQN0HWT+9mBiYx9lLypqXMV1HcU0ovh
         sGgOZbiqku7otbiHgIwvFO+Z7CRK1pmQw7EpskGSTkLzxbBdOOPPmhrb2YkpUH0Ve74Z
         69+hoPq7LDAtVnRrQHjL2MBbtYYZTmmNtv1CXJqW8hel4yXX642PMSiV8pyiXi9G6DcQ
         Kv0F1k1kvOVTgUcecCgHEs8wuVdvqjM1KGaOllFQsaI9adJZG+pcq4P/SlY85hnOKWOy
         1ScQ==
X-Gm-Message-State: APjAAAXyKDSNrzx4XgqNCeAuT4Emi4AgvykZ+eLtuAmELS9oE7leSR6Z
        8fUkw3D3cIBLEJ2V3WmwNyAJ1/62A9l9h59+Z9A=
X-Google-Smtp-Source: APXvYqxMufOtbvKV13FvNPmryG+/XOOEmR3DR0kIntYTY4NMfjYK6cwvN4yqoVDuf2crTsnMF/95wh85ZkvkNR8zGc0=
X-Received: by 2002:a67:7d58:: with SMTP id y85mr5496780vsc.96.1556629217351;
 Tue, 30 Apr 2019 06:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com> <1554907730-14792-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-9-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:00:05 +0200
Message-ID: <CAMuHMdXi=cQpifJxG5vzhVJJ4L8msDYrfVoo0bEGXkfAbigsUg@mail.gmail.com>
Subject: Re: [PATCH V5 08/13] ARM: dts: r8a77470: Add USB PHY DT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 4:55 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Define the r8a77470 generic part of the USB PHY device node.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
