Return-Path: <SRS0=1GST=2A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBC4C00454
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 10 Dec 2019 13:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3D7D20836
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 10 Dec 2019 13:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XR+Y4Vgw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfLJNK3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 10 Dec 2019 08:10:29 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39013 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfLJNK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 08:10:28 -0500
Received: by mail-ua1-f67.google.com with SMTP id q22so3488005uam.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2019 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=daPhyI3cnT8tqGxGW2b0FD9cbeC91mjEIUAmLAV7bvY=;
        b=XR+Y4VgwLG/vZ+HXu2DETs8YXjJwzXlk1bjXQ9uttgPou3Xtmqnu35UV4zyfXGE0Ou
         pFD8y2z8ye+VE+sHdTYTrm6IvoKrNcaVxJtNVnS6i9WexqvraU4OxdwyLffwRPmrbpHP
         fyIDbE36bLR14W7cQxadTLgkBS7PqgUuYS6/nkxqcFvqAfq/86sR46c5pDm/UJJnv4BB
         R/bMz8Sct1d0JXKagCiGNtgMh1KZaZJAiDqI5R/3UOwQdYRjjCZRFO/DJAW27qPuYP55
         4gD39/81hCjcrTDBbV3tknUhfT/GCxX5b7FcKGtNSl5xn2E9Y82Ars2KOhUIMWXVSAoa
         Ve4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=daPhyI3cnT8tqGxGW2b0FD9cbeC91mjEIUAmLAV7bvY=;
        b=JCXV8K+xRwxAOnLUbZqnclcsh8GJSSF3UPDoqXsf3lVvjjuPmz4jZx0I4iWVF9qbPv
         lxTcQoK/5S0C2y7JamIQ21yN+/zt8Hf1w4XCZvmMyrCGUGl+5Sl+2jvuulvM5Kq8SA/R
         SrTWIMnexa7QR+AD6exCyYO/CuNrlRZ+FpFcM5qjoBERFvdKF8RbBRVv2P7nMTAdad1/
         t2LW189ITv4AwnXG6FT+9Kv+EGWZw9PdLFF9Fvt13zeSOsLr5lKBZgwSOxvmOwZdCNmx
         8v2g43MRPHP0aE9aLtUQu7b/PN01XL4DVoFa+TMLx4zPx38Gehojnw5qp/08AEOmnDRE
         8PQg==
X-Gm-Message-State: APjAAAViYGX5u4i7JXcw2+uAwsSRPMNc5PUmtMmD98H5Lmt9/VPq4F/9
        NYbMRqyraLLC/NLEYfGMQI5z2NvtYAp/oNymY5JC6w==
X-Google-Smtp-Source: APXvYqzUPVdxhFTx/tArS0nYzpOnGbVRVUnFgJ9Tlw1eralfH4zj/yvRQnt3Qbr6MJ61MvlX4f2U/eHkVUxdKcxnYXc=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr8958300uas.19.1575983427326;
 Tue, 10 Dec 2019 05:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Dec 2019 14:09:51 +0100
Message-ID: <CAPDyKFpXanmDQq-minnX4KNLVSMatOQRnuT59sDdAZC_MDkp8A@mail.gmail.com>
Subject: Re: [PATCH 0/5] mmc: renesas_sdhi: prepare for recent HS400 updates
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 3 Dec 2019 at 21:05, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Due to recent datasheet updates and other internal documents, HS400
> support for SDHI needs some refactoring. These patches are the
> prerequisites for that. The first four patches only refactor code, the
> last one does a minor update already.
>
> This series has been tested on Renesas Salvator-XS with R-Car M3-N and
> H3 ES2.0 with tests I was able to carry out locally here.
>
> I will send more advanced patches on top of this series as RFC later.
>
> A branch with all the patches applied can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib
>
> Wolfram Sang (5):
>   mmc: renesas_sdhi: keep sorting for quirk entries
>   mmc: renesas_sdhi: make warning more precise
>   mmc: renesas_sdhi: make quirks info accessible outside probe()
>   mmc: renesas_sdhi: remove 4taps as a TMIO flag
>   mmc: renesas_sdhi: use recent tap values for HS400
>
>  drivers/mmc/host/renesas_sdhi.h               | 10 ++++++--
>  drivers/mmc/host/renesas_sdhi_core.c          | 23 ++++++++-----------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
>  include/linux/mfd/tmio.h                      |  3 ---
>  4 files changed, 19 insertions(+), 19 deletions(-)
>
> --
> 2.20.1
>

Applied for next and by fixing up the comments for patch 4, thanks!

Kind regards
Uffe
