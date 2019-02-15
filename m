Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF36CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 16:49:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE4FA2146E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 16:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388311AbfBOQtu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 11:49:50 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46207 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388125AbfBOQtu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 11:49:50 -0500
Received: by mail-qt1-f195.google.com with SMTP id y20so11508856qtm.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 08:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=umXdk4llB4ngUI3cuju1TS9i8jo7BkhbigS9c4y94uk=;
        b=E8F772g4QCP1rV3pQSV0U/8XKj7RpEoD03gOnxn/F9MPfufUXS4lay9T/N5k24y8Q7
         MdKYdyQEviL2rF+jcQcYjCy231T4ZTpfhUpIUYUpNM+uEo6uFuIbAE8jO+w4620B6bCS
         YPh56Wwhe0VB5zxB/5KvqD8quIUl5Ma0YggXIfQ1M9DyZMqTjQrBNqAarFwsjIMkMtfT
         FEpRwuhAezovzTiBXrD6aYuAe9kuq3uS4Qy1/MsO8E5ZDsJH/TwFzRBfEGI4oYTukIYf
         Wgy/OzmA71ccxue0RpUVJl9hZJeucipnv0vRh8vnoGHoRXXy6ALr6DScY2AAC74sM/eS
         lKAA==
X-Gm-Message-State: AHQUAuZDO6MlU6dg9nNDmaPb5WpIRK0cmu02PT7BiLQmwgg19I/tmT0k
        KBlvc7JrivBGgeUarDatkEDfSO5iUv+oe2nEtJoMJQ==
X-Google-Smtp-Source: AHgI3IZfYEDuSR2GuxCjF7nP/5SpEuXy7+iXx+NC/hbkgzObPy43O1wsWcQKzVCggdVSCOeOK1IsgpHTHYpydirn3xU=
X-Received: by 2002:a0c:d791:: with SMTP id z17mr7816725qvi.149.1550249389280;
 Fri, 15 Feb 2019 08:49:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549622472.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549622472.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Feb 2019 17:49:32 +0100
Message-ID: <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC updates for v5.1.
>
>
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.1
>
> for you to fetch changes up to 5347a0203709d5039a74d7c94e23519eee478094:
>
>   ARM: shmobile: Fix R-Car Gen2 regulator quirk (2019-01-07 13:24:07 +0100)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v5.1
>
> * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> * Add missing dts files to MAINTAINERS

Should the bugfix be marked Cc:stable and and Fixes:... ?

Pulled into arm/soc, thanks!

    Arnd
