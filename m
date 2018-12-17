Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3467C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C355206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbeLQQKm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:10:42 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44532 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbeLQQKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:10:41 -0500
Received: by mail-ua1-f66.google.com with SMTP id d19so4589601uaq.11;
        Mon, 17 Dec 2018 08:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbMPrCt8wPsfmBmKRJfTaJZv9P/u9/iNkRiEXSSIM1M=;
        b=fV1r++4D1YBLUdYpbk5455DzryMkLGEg5SlOl2QZW42bRsHXAsjBnbvIVSN1vlO9yl
         B9z6PcamPKtozxIVSfUkF8ZtRloxJ5psn3uqqOegnvcn9B7p8KulMe+5M7uUGSsr0pnj
         +0UcLRT6u2nCIREtyUKXx2Hw1YZ+zyDbStZ3mpW+Ll0E8rvl4AxGwlU/9J7/leIhJM3q
         pUIomMQzN/iu74gRU0ESB3s6EZRGxH5Jmc/KZKlE/gawiaNaneEIMPkUXNEMt2EugS3f
         9JfcfnT4jVyPV1kUkkggerqmiZuGb7Vy1cnTQx/EUDqf/Ye5Oc4+VOa/xOsBiCoRT2i4
         tx2A==
X-Gm-Message-State: AA+aEWYhv6Cpj0u8s4uaBMuQFGnmB4RYetl9y+g3fsIjB+LQPygU6mi6
        /wK2aDCi/GG40QMuWQhnEj6EL59yjlw17ZGXtz4=
X-Google-Smtp-Source: AFSGD/VUFPxeceG8R1DnWwXkr2xoWBbvu3EZbDeRYHbt9LhP6uKsX2TnY25OBSYa6poWqQhFAjOB+5+aLoHnO6Yx2fE=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr6037054uad.78.1545063040771;
 Mon, 17 Dec 2018 08:10:40 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:10:28 +0100
Message-ID: <CAMuHMdVnxr=UxUwMHkooEHin0PAE5S5NJM0+NJwQdyzULbT4Rw@mail.gmail.com>
Subject: Re: [PATCH 01/17] arm64: dts: renesas: r8a774c0: Add SDHI nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 10:37 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add SDHI nodes to the DT of the r8a774c0 SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
