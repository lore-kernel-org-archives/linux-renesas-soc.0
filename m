Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE2EC433FE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Nov 2022 20:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiKUUaH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Nov 2022 15:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKUUaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 15:30:06 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BECCD92FD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 12:30:02 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so10096751pjh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 12:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=myNR1dHCzOToepErRrsD8EFVvG4FbDL4QiAIuBT0+Ok=;
        b=u7VlmPLF/RvGHIzZiQ5Uh0MzRhuDgphVQ8PBip5YmeAO7Z7FdNN0Igspn5h05rjCwU
         H6QRi9//TntfDBFM0bG4o9KSnOP96Z8EmU38+lO1vscPaEVFAbbKnibmv4LbbWk59jJH
         BVR9YtqYk6xFQtDYFPFTq/k3lnWExzWA1i9hSIyXnnfGxUE/zjbPcXUVvguBo6deXoK1
         IhEePpS3rZ5L6CcFF1kFTO+YDp0OUGMy0+FcX0gfZrWruWHgQphM8sjzGXuF4OQPci0O
         7+rNNJKGXzjQNevCHEhwj2s85oBa7gqrncz85RHpE95IZpy0QOc8KQti8MRlsGTPjex7
         IKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myNR1dHCzOToepErRrsD8EFVvG4FbDL4QiAIuBT0+Ok=;
        b=zEfb3vyetbxqr/0aSPDWFgnePgoLyFx6oPELehLbrjfZPOC93x5EqVO5Buw7eXD44V
         mCy2lQJF28RtNsCm7GItzF1cCy1At9SwTz258RVfwifoyRzp0nUe+q3BJnnQS1FwFzo2
         OtlwgV0KGmYhRDLO9SQk8cf5hzjKvVzAYJnLY/1Fyb8VSXbfTHmYI3gb4DdRottEoyaT
         q4/K//QEgU0gt2WQcdrIi1y1+Yslt8SeGHn2TvWTyDQ4WrneaXIcSjgVeUestwoz5zID
         dXW7Auz6H2VaQLW8Aqc6v/oh0XphDIRm26bbkvFx0lyBNShmqfIN+e+LZhEJ6Yl590VQ
         cxSQ==
X-Gm-Message-State: ANoB5pntiTX7/pX0NdJfzCfQ+/BjruvcN/FGEfHDpOqzVGJdoBkSfMJQ
        zm4GyzN/6MjGs7eYw17un/kZ1qpqolI3XeBQpc6Ogw==
X-Google-Smtp-Source: AA0mqf7ZrUy+0ZfCtjXsI8kHFev3U9+wk0wofNjh90U1cdOVcEMC95/tWTvBR/GxZKZ3Ov4MfHVlNRNVNIEi1qMI4o4=
X-Received: by 2002:a17:902:b283:b0:186:be05:798e with SMTP id
 u3-20020a170902b28300b00186be05798emr521420plr.37.1669062602054; Mon, 21 Nov
 2022 12:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 21 Nov 2022 21:29:25 +0100
Message-ID: <CAPDyKFqEw7zr3XH6zM14UgFOscbC11ovSNpC5k2OyGhb6=6=2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mmc: renesas_sdhi: upport improvements from BSP
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Nov 2022 at 12:35, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This series upports two BSP improvements in a refactored way. BSP patch
> de9461ece1fa ("mmc: renesas_sdhi: scc_ctl is always set in after R-Car
> Gen3") made sure we have a pointer to always reset SCC. I refactored it
> to include Gen2 as well, so we can optimize the following code a bit.
> This is patch 1. BSP patch 15d7abbfc3f0 ("mmc: renesas_sdhi: reset
> calibration register") added a new quirk for devices which always should
> disable HS400 adjustment. This was only applicable for SoCs which either
> had bad_taps or needed a calibration table. So, I simply used this logic
> directly instead of a quirk. This is patch 2.
>
> Two cleanups come afterwards. To increase readability, I finally did
> something I wanted to do for some time now. Having a helper to check for
> SDHI quirks. This is patch 3. And while working on this, I discovered a
> new macro from the MMC core which we can make use of. This is patch 4.
>
> The series has been tested on a Salvator-XS (R-Car M3-N) and a Lager
> (R-Car H2) board. The patches are based on mmc/next as of today as they
> depend on d901e2ba566 ("mmc: renesas_sdhi: take DMA end interrupts into
> account"). A branch can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/for-6.2
>
> Let me know what you think!
>
> Happy hacking,
>
>    Wolfram
>
> Changes since V1:
> * added another improvement to the series
> * reordered cleanups last so backporting fixes is easier
>
>
> Wolfram Sang (4):
>   mmc: renesas_sdhi: alway populate SCC pointer
>   mmc: renesas_sdhi: better reset from HS400 mode
>   mmc: renesas_sdhi: add helper to access quirks
>   mmc: renesas_sdhi: use new convenience macro from MMC core
>
>  drivers/mmc/host/renesas_sdhi.h               |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 29 ++++++++++---------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++---
>  3 files changed, 21 insertions(+), 18 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
