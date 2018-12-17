Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D99C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDD6D20672
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbeLQQRl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:17:41 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36465 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbeLQQRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:17:41 -0500
Received: by mail-vk1-f194.google.com with SMTP id 185so1286978vkc.3;
        Mon, 17 Dec 2018 08:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLjk3hSRMIQigVQdF3yOme1lgHa3AVndtuV8MU1qDHg=;
        b=HBFMeCv8brYQ6B4c3/x1rqGbp7RQrE+ZCQLWxcPPQhULq2ib6JXzea0/A8Yov2lADV
         RbQGfcqlFslB0QvR6HE5X+XMVJ8wA/H86zLDfBUX3/ufNtONXdsVZ7MsIITEACUVNj2I
         SZPGMftcekyyOQR8eMiz4RFkhIMPWuat3ao48CDPCbb2cmcpDMmnTT99xB/1p+7vFWQU
         5c3gmZUutWXTb2Wgcr9n4ZW+ECHKQ2OfCkSH2B2clIMgb7PCSNO2rzRDDR5PUjcFPP3o
         oE1fgJCgDQyStVICDmojpufdOjJrgODOkD0kLxsvqSsq9RX2bE/atVjaWVnjKLU950FG
         Uj8A==
X-Gm-Message-State: AA+aEWZvEvV1GyFYhiiuq8RLHGvuaMSrhOE3wxdmvLeb1s2hocs2Az8a
        4MwgtOldj81GU2aaxeYq4XfPxtVsOeI9qRBHbE3eIgz0E9E=
X-Google-Smtp-Source: AFSGD/XIEmotJEKk87aUhTs9tZEFSt+aXyXFOOv4c3BkflemAN+ayNltrMlLASt7VFFxOoVL9fqRkUJMJrchQaYKi48=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr6275177vkh.65.1545063459866;
 Mon, 17 Dec 2018 08:17:39 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:17:26 +0100
Message-ID: <CAMuHMdVDgp6en5EKC76YFtiono9EyHdF_CKY+C_mZ6SabG7awA@mail.gmail.com>
Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
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
> Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
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
