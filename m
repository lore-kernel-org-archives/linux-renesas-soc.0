Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA463C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 713E6206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfCKKBw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 06:01:52 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40161 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfCKKBw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 06:01:52 -0400
Received: by mail-vs1-f66.google.com with SMTP id z18so2299977vso.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 03:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sZ1tkBQrN7LN2EFRrMI231AQ7EzVWtIgYKY8Fb5QGdE=;
        b=ZF+yPbO0ZMfyfePJYNFtoNOvG/1m16hNZ9ItHOhrFc1Ku1IDf/xcBj+zuMtiQ14edE
         /aF54WZXQQ7YP49dgFxdBFtKOMz+u6nCylnGwFClwtclp9/RRXy0+wxYV1RzJmBBbN00
         9qAKiTPZ8783xHwCb3ZnFqrVtpZ5rqWy0CMDpyuWU5a5hnP7zkmof3egNarE74FtHrnQ
         fFd7PQvHEh48CUeB1HK3K43QpLQG5+GTMHdEsp0TxRth+n4xtjriU0g2n2k7qtCwZF89
         K+CuIhMLz5/i00Ip81nhtzFxk/1nOqKkHBti+MlI69+7w9IXGII095yPELD90Ph2GyEh
         gr5w==
X-Gm-Message-State: APjAAAU3a/fRAGWmBmLj1aWYRQslohvi+XR6+kvM0r8O2KbT+zgAxzuc
        NcWLFA+17g/exr0URtCk87iN8Ti5eQ5DvVEC6h8=
X-Google-Smtp-Source: APXvYqywxDpQK+pp+0JfQogVmUca62DXYIswjbbT0/It1NrZ84GJPb/ZJL2+EsY1wfT0VjGm5ukNMBwQpZf0C79bdM4=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr16205914vsc.152.1552298511022;
 Mon, 11 Mar 2019 03:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190310130611.11114-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190310130611.11114-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 11:01:39 +0100
Message-ID: <CAMuHMdU1G9aPxu-9Cm2CGKXJqxoK0FF_pw_tSUF+vwq2Z946og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Remove invalid compatible
 value for CSI40
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 10, 2019 at 2:11 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> the R-Car CSI-2 driver but was removed before the driver was merged.
>
> Fixes: e961ab42e034d469 ("arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
