Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EFBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9E4620675
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbeLQQOm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:14:42 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39198 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbeLQQOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:14:42 -0500
Received: by mail-vk1-f196.google.com with SMTP id s184so1311160vkd.6;
        Mon, 17 Dec 2018 08:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bw+NyU0c0m5qswWF+U+6J1x4y2zv3+u4teZruOOQ08=;
        b=ew7vDB2ZqKhtIwoykInL3imXFXuK7YYkzqXIa76ZYuQTXfO/WknJWltHQUsK6sNxTv
         ehXcDP7F+9tIcxl031/rgLFPqwJNfKwtG9uN3TRzLnPEdAa9MZUZpDBu0UBo3YNVMjEw
         1cdc024BgbxfUIbICYS03oLx0+xQnWial1Q06aQ0iweqmEkQEOQOd5GHY7V6FPWmY8vz
         JBG7hBzqg1oiS2dJ5PesPG+vrc3YqFhn3+LA2WHPmPSIEUP7hbdwbAQ+DN4V+jHbs4V/
         7e2/8AEWHugvMEtRNHMTUwxn9HUIcf2rIb1xC8PNKUMomOcrmFk6GDgXmLswzy034Lw9
         ASsA==
X-Gm-Message-State: AA+aEWaTPeOymOF/kQN2L+QVC5pb+6BZgkiAnRXG3pa8V6rA+oSuzKDa
        ZeoAN4o9treV1Aj766wcnPRkILgVmwO3I9ji2kE=
X-Google-Smtp-Source: AFSGD/WrG7QnVpG56wphAylbuOC/uJon5IP4rFfHX4I1Ob8AbQgcJOZVQg+xNAfu6TS/7BcCgDCTOzzenwJPSSt3gMM=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr6269592vkh.65.1545063281060;
 Mon, 17 Dec 2018 08:14:41 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-9-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-9-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:14:29 +0100
Message-ID: <CAMuHMdWvjaewmkVq0kBJXGjg68xL5y-nm-+T==+n905YyrxZMA@mail.gmail.com>
Subject: Re: [PATCH 08/17] arm64: dts: renesas: r8a774c0: Add PWM support
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

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add PWM support to the RZ/G2E (a.k.a. R8A774C0) SoC specific
> device tree.
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
