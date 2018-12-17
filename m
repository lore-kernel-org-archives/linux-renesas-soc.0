Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3B9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B8C020874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbeLQQTM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:19:12 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41642 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbeLQQTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:19:12 -0500
Received: by mail-vs1-f65.google.com with SMTP id t17so8023568vsc.8;
        Mon, 17 Dec 2018 08:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwE4+5JsM5OICJbet/XFGGaJjXR6U2jDX9mIHsGHEMQ=;
        b=Z68l+tCVWTdeQ7q93D/8PMrDlBJVCgOkgLj3IrGvvtcQkoTDgQQVRKN2FzGVEZ5ALs
         D6YIbF67rJclG3Gt3sEQdSASzQqrjiweb0qIHuYyTG0x/FHDTVBpcYa6QDkTrFlnxLOh
         RtQgbWLWY9Lp4s8HUUr2prwFxexoV9cM3S5pzj5uiD0QCgQxHr2leYwsqKUU4/CQW8yA
         lexS/13tl6LyZxXhjs53HQWH9pfjeSzhk/7MJqjx9yXopQA0Rqai11Z8i6WJvLlDs9lu
         DEluYpBnDwCkKnNv8A4FTy9Ak8MHz7vwNU9/85EEq3mk3H1wGLHnky7T837SRZeIs+9L
         vS9A==
X-Gm-Message-State: AA+aEWblWaMjmBPg56zQ+KIxcZi1c/uFNC9yw0PvffA8U6jSC59078GB
        2oIPUOsqFWMBF7PTaiScbagBxbAXTzzFSMXTUEw=
X-Google-Smtp-Source: AFSGD/XmwCnG1gHg1HmiWddXgdguhMzEGzvnpQgGApoedbXLCoygz6uH/eNZeAPGYSbywomqSX0xj2Ev+J9TIKohsVE=
X-Received: by 2002:a67:f43:: with SMTP id 64mr6682117vsp.166.1545063550537;
 Mon, 17 Dec 2018 08:19:10 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:18:59 +0100
Message-ID: <CAMuHMdXZ4fuz-N3uhtGZQ6Gu=j4wF4OB_tJ8H+dO93k17_sWwQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 SYS-DMAC to IPMMU
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
> Hook up SYS-DMAC0, SYS-DMAC1, and SYS-DMAC2 to IPMMU-DS0 and
> IPMMU-DS1, according to what reported by the RZ/G2 User's manual.
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
