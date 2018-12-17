Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3B1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C78820675
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbeLQQPo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:15:44 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36825 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbeLQQPn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:15:43 -0500
Received: by mail-ua1-f66.google.com with SMTP id j3so4619505uap.3;
        Mon, 17 Dec 2018 08:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNYYzSLq/Fj9ei5MgQmkB40paznf+UWhlbyVfCJsbVI=;
        b=QvDvao4r/O7j5T617YLQFPq2f01waSijN9H0vq7zf8YGjemOvWYYF/yAeNkcfGZ4s4
         prldnUb3olcTayIES4UPdacpgm7XjJVd0d2ZkJ4tNbpUYH1aUEUfBBp60M2LknEdNs61
         qIWPEEhVVrYVKgO5vVnd+FrJX4xu8BRknD0HYV9SBQPhw33W7IhJrlOo6upwhnR5ByJ7
         32WaiOdC/75GqnIG+tjnFuLbxnYmAgvkdE1hYxJKcbiuET3hrtDwfwD2HMAKK5sYIYdJ
         ufC8tnemOz36hYZNN6P7A+5/CcYBXLjjsLFPa3/oUFPhoP4VmgtQgkxDGmb7T/Q7dWkG
         URyA==
X-Gm-Message-State: AA+aEWb5ayZFfPhXKoL2wNk9G/gHkqoNu+DXI9TR9ipOmDiMvPBL8wIN
        Cer9i5Emu6hi0G4/tMayK3neEVoJagfmXqFFl/U=
X-Google-Smtp-Source: AFSGD/X+kzBH16mvWenXGeXqoFY6+NYb+kNogO10c6/ErrG3dzbv4oRfkpaHdGsn8HvyyLUMRLNHIhm5gDtnPZY+Moo=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr6258456uae.75.1545063342575;
 Mon, 17 Dec 2018 08:15:42 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-11-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-11-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:15:29 +0100
Message-ID: <CAMuHMdWvbKGqYhsJ0nDeeVE6PXQO2iAHcLkkDfcw+B_zEiK=Wg@mail.gmail.com>
Subject: Re: [PATCH 10/17] arm64: dts: renesas: r8a774c0: Add USB2.0 phy and
 host device nodes
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
> Add USB2.0 phy and host (EHCI/OHCI) device tree nodes to the RZ/G2E
> SoC dtsi.
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
