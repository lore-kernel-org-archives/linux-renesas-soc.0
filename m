Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DEBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D59820851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfCANjG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:39:06 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39917 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387795AbfCANjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:39:05 -0500
Received: by mail-ua1-f67.google.com with SMTP id s15so22437164uap.6;
        Fri, 01 Mar 2019 05:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yw1Hwom0nO7sn24blU6hKG6bXWDVebNp0d6RM3O/I3A=;
        b=QXPW6CIQgtqA52xjE/RIXlcleycPe0oXLPy5tMD0qMAiKqy4GKJR1JbhtTXZv0SX7m
         bKcX0cdPLq/45wc4HwmAJ56hNqehJTAg+BfHYKwEAjhWo3tI7vYVbjyxIiLDYLfBtDQp
         MRf4fREA27z+VcR8dz6PawNAtmXJP/emPI30g1OqESwsHdpetaqw4bnocCuJ6VUhOMOb
         6VYEqGrqtkr52x/tBq+lFam6TxMPM3pWR0FM7TOka0u5f4Go120CfFIwU1/MKkG5IfuS
         f/YN/nif3F7udtxMLR/UuvhsaB6x5SVp2zZYfzvzT1T/1XJr3EurguL1ZPZYVzH80Reb
         CDMw==
X-Gm-Message-State: APjAAAUlYszLrMhVRbiolVXVIr9a+VmUnXosIZBdw4WfIFr5mhfJTZvx
        K+BcwcukwesLaPG5ucdUSBxA/X++c4vI18gNrs8=
X-Google-Smtp-Source: APXvYqwqNE0xh+jUQB9izRLrpxnG8IFiAwaCIcPqlaZP3Gga5STna75/5Of4CBbdi8Ifu5p4TkKzBqD1WhsE8fmEbEo=
X-Received: by 2002:a67:8588:: with SMTP id h130mr2503664vsd.11.1551447544370;
 Fri, 01 Mar 2019 05:39:04 -0800 (PST)
MIME-Version: 1.0
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 14:38:53 +0100
Message-ID: <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
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

On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> identical to the one found on the r8a77990.
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
