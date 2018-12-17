Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A76C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 938F120874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387878AbeLQQTf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:19:35 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33496 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387739AbeLQQTf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:19:35 -0500
Received: by mail-vs1-f67.google.com with SMTP id p74so8066497vsc.0;
        Mon, 17 Dec 2018 08:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2x2sGn1jYI6YC9B/EvQ/7cTREJcgUChzXGFF51CWMk=;
        b=O7nfeRQ4mf0JBSUi1Gs3I9TRPipC4k0EDLCrEWmlxS17qRwZiW+bGa4+5XZ6siH1L+
         BCjGpKZ9Qx891q2gyAmozprLrkf3S62egJS8jMasanjUQMlzShsDJ5fhTxA4uRRITNv7
         ru18xylMBCfueUoVUM0GRbzsLl1yTGGxTZO53MufR7BdZnKg+G+hEZQ3smB8744yhib9
         PianvQWy5XsJHDJpGqG5UyLht/RvErf4AI6mqiPlS4T2es/zIbgo88onmQcPChinKTMj
         V3Ld8bgDWm42grbz4C0gA6aoTaUqaLKVnWPBoVwpb1XVEGVAfZRUexz3jg3/Axt16DqB
         3KSQ==
X-Gm-Message-State: AA+aEWbwmQPq5nXTJz2I0uRmJ4XvZBS3hy792at8fSd8YftOBnZJST/D
        GKGKMiMilGb2a4zeMMkuaILkmwDZQEa2BWD1McI=
X-Google-Smtp-Source: AFSGD/UhN3EWDXvhRrU7fPI+oACSPgHl6EuTajh1vTELBE0kaoG2jijz9bhqaOcIk+dqvWv6BrHmTyuklgz3aDjcI8A=
X-Received: by 2002:a67:d119:: with SMTP id u25mr6267132vsi.63.1545063572967;
 Mon, 17 Dec 2018 08:19:32 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-15-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-15-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:19:20 +0100
Message-ID: <CAMuHMdUYsmqX__i14mqWeb_omazGndgaFbjDo=1zcUZ5OCWtAw@mail.gmail.com>
Subject: Re: [PATCH 14/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E AVB
 to IPMMU
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
> Hook up the RZ/G2E AVB device to IPMMU-DS0 as stated by the
> RZ/G2 User's manual.
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
