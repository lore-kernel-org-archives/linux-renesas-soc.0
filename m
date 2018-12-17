Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75679C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C9732145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387942AbeLQQMa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:12:30 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46915 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387614AbeLQQMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:12:30 -0500
Received: by mail-ua1-f66.google.com with SMTP id v24so4599096uap.13;
        Mon, 17 Dec 2018 08:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feE1MpRayHAWKvVpW1BOAPAs9XE1IaSAhB+yFgVU164=;
        b=YV6gqAEh3MzpVksCBjc1TUM81qIEiBt6ORCvfYCY3aRJCxSW+Gj1MZzizSTw7cWNfC
         x2GsrkcR6nwVOf3Y62YQu7uuC4NuLVyEWZJfP3ynnUDL/Ro/AmeETWCm7frJENZkuXWQ
         rKbJAKmeIDjwgA4hlx5vOxWiZxM3NQEatq/LZ0FJ0/lZvrXXr56mRvMgCYXUUHZNt/VU
         cqaxtFr1u4use/beAph/8qJrkaTB9hQl5A0qsEYrg2YhTYvPLizKZB0WM2THRrl7DfVZ
         sX7Sx4QDLzfV2hVdIhT8chC+ddNI02Cs9U0lnLwJUwa7GmtV1H+uGHCLW/MXJyEm1R4T
         IzuQ==
X-Gm-Message-State: AA+aEWbbOfU/1A3IWmrjYJyd6dCAranrSOtKSMMWd1xGQD1RhfYxO8gf
        bm7I+xDTsGITD3sZE9JOq3/MN8v8uGowYLFe8Xg=
X-Google-Smtp-Source: AFSGD/VXEgq96XSyQOKQtPga7IQDyqawRonERf/cVa07R8nBdrQ6T0UaGw/SllDNiAb1xv3TGADuY3v/PzlgvV13gik=
X-Received: by 2002:ab0:465:: with SMTP id 92mr6514392uav.28.1545063148589;
 Mon, 17 Dec 2018 08:12:28 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:12:16 +0100
Message-ID: <CAMuHMdVvGw4-=vxn5CgF7kkb_eYKqjNby0FvD8Mh22EkEt8hTA@mail.gmail.com>
Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS support
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
> Add the I2C[0-7] and IIC Bus Interface for DVFS (IIC for DVFS)
> devices nodes to the r8a774c0 device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

The register size for IICDVFS can be enlarged later, as the mapping
includes the full PAGE_SIZE block anyway.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
