Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35422 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdEBMDN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 08:03:13 -0400
MIME-Version: 1.0
In-Reply-To: <1493723743-22821-1-git-send-email-horms+renesas@verge.net.au>
References: <1493723743-22821-1-git-send-email-horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 May 2017 14:03:06 +0200
Message-ID: <CAK8P3a10fwLwA=DzMoCbxoCewA8YqcJSzW8Avqt-vX+kSx0apA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/5] mmc: renesas-sdhi: refactor DMA support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 2, 2017 at 1:15 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Hi Wolfram, Hi Arnd, Hi all,
>
> the intention of this patch-set is to refactor the DMA support in
> the Renesas SDHI driver in order to make it easier to add support
> for using the SDHI hardware with different DMA implementations.
>
> This is based on earlier work, posted as "[PATCH/RFC v3 0/6] mmc:
> renesas_sdhi: add R-Car Gen-3 DMA support". It attempts to implement
> the reworking of the driver proposed by Arnd[1] in his review of that
> patch-set.
>
> [1] http://www.spinics.net/lists/linux-mmc/msg38004.html
>
> Unlike that patch-set this patch-set does not add support for
> R-Car Gen-3 DMA. Rather it focuses on refactoring the code.

Looks fine overall. Remind me why we are not using the dma-engine
framework though. IIRC this is because at least one of the possible
DMA implementations is tightly integrated with the TMIO register
set and not easily split out into another driver, right?

    Arnd
