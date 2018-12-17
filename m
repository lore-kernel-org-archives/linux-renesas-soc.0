Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F8CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D42F620874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbeLQQW5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:22:57 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:32787 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbeLQQW4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:22:56 -0500
Received: by mail-ua1-f41.google.com with SMTP id t8so4641889uap.0;
        Mon, 17 Dec 2018 08:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86yx4fx5djk5ZFAYqpXPvBM/1PfhUj1J20erqv12+og=;
        b=Jz0fclb9B1snTAJHGqokE7RyfJxXETZd19dQi6Z7b5ygumiZ4nN2IzkzHHTKzB5+T0
         iHj8ANf5okP5m5oEEPGDAaxLC9XSLCBQ0JqirXXohaB0F/zNGiTb148zFb8YvsjTHF8f
         79JZdj4NCzelmD4htkkJETadqNWKssxWJJKT0OkzjXZOVwg1qUbFr3WXkSD75H6176bg
         naWnYxHSsYnl1DHkh9BxTldbL7vltmpxDdmawZKCho4X0Q4y2YZFR9qCVF1ZhVt4wZI/
         wZKk1CKvZHMCi6L9HwpYYdClR2wa8iHTaKA1vQIHAGLd18DvFOGGqJaphkNIUmEGHPye
         v+yQ==
X-Gm-Message-State: AA+aEWaZHVRavp1MtqjP1AOI1iI+gBG0CQmOSI5JkgBuDHIa1KlaZt6d
        SF/sgPBMIEFXFDUGOCGO8cU4PjbR6V1+KTLMAjU=
X-Google-Smtp-Source: AFSGD/XveWK+WHFqWc+jAYBhI4wvUasVNMTJXcVZV64GLqSgCJR06bhDpU7xaBdqtY4LTDkyJqeD2wk3iC2X1epPIfM=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr6272013uae.75.1545063775416;
 Mon, 17 Dec 2018 08:22:55 -0800 (PST)
MIME-Version: 1.0
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com> <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:22:43 +0100
Message-ID: <CAMuHMdW9DXx81gZG+UK-+R67iL8EYe9gZnEhsjM=3kmexC_5gg@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add
 R8A77990 support
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux PM list <linux-pm@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 3:51 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Document the R-Car E3 (R8A77990) SoC bindings.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
