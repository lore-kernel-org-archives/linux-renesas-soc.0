Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AEEC282D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A76E21872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbfBANh0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:37:26 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36869 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfBANh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 08:37:26 -0500
Received: by mail-vs1-f67.google.com with SMTP id n13so4195614vsk.4;
        Fri, 01 Feb 2019 05:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPaSQz4TqsTGHNYXVWq/wjTAySYseaKoSuU71/YJRt0=;
        b=iFO+TSiVlf1xdQAzWmwCaDiQk4uDr0sHPjSBx6dYTvf+Dcv3l9bQ7AgFkrJq1X5DLG
         GQBC1/l74OyR3IZfNKIZfV8lkFJY+ZW7x4YNqZOLxAqmVjj+ssiCinw5Jh8KmCjwb7cp
         dvkL/xQ8GWjw1CruGOS0F4Z/Gbzd01Xpdy+3ELxI20h1Fv0bxF2+rlxDxBbrXKj926H9
         JoORCDhJ5QblffICGKo434areZJHpGKdj2TggNihCTzxv/hiNoIV/gl3/9yEWUmSxHOw
         /a2u763p2dck3iLCLtyZVnxWCOuXfGLcuWzP46XT80IY3UZu9DmlfwMxAdZ2hsBbaDj5
         gC3Q==
X-Gm-Message-State: AJcUukfS3EFQMVCfTMUY5gei6S+Biwna1Hp+oh4GjdDSb/sci5RRwnSY
        y4AdxByDgPPCxy213t0aXsEuOk7wkJrOi6vzd4c=
X-Google-Smtp-Source: ALg8bN7gBPXgEjK2HTCLgVQTThnWj4Bjl2ExvWH2VB9+qWK+oAKwIjcqD3VxrxY+q3vUBnP7LZRYxAbwSAs4N38fIz0=
X-Received: by 2002:a67:d119:: with SMTP id u25mr15342561vsi.63.1549028245509;
 Fri, 01 Feb 2019 05:37:25 -0800 (PST)
MIME-Version: 1.0
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com> <1549015841-33536-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 14:37:13 +0100
Message-ID: <CAMuHMdVdFxaa=G7rhdmxa+b7DM_yu-vTyf4GrRidWsXJjn4Hqg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a774c0: Add CMT device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 1, 2019 at 11:15 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a774c0 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
