Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f179.google.com ([74.125.82.179]:42281 "EHLO
        mail-ot0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751143AbdLUPRj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 10:17:39 -0500
Received: by mail-ot0-f179.google.com with SMTP id i1so22704425oth.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 07:17:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cover.1512553735.git.horms+renesas@verge.net.au>
References: <cover.1512553735.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Dec 2017 16:17:37 +0100
Message-ID: <CAK8P3a34Vo21rwJgjiVn_kJdJuQFPTmoKQoFbhrnPK3M3CCkVA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.16
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 6, 2017 at 11:21 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC DT bindings updates for v4.16.
>
>
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
>
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.16
>
> for you to fetch changes up to eebd0732136fd293c8f15a435978c1c34cd7f32f:
>
>   arm64: renesas: document V3MSK board bindings (2017-11-29 09:18:24 +0100)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v4.16
>
> * Document V3MSK board bindings
>
>   These are the bindings for the R-Car V3M Starter Kit
>
> * Document M3-W-based Salvator-XS board bingigns
>
>   Geert Uytterhoeven says "The Renesas Salvator-XS (Salvator-X 2nd version)
>   development board can be equipped with either an R-Car H3 ES2.0 or M3-W
>   ES1.x SiP, which are pin-compatible."

Pulled into next/dt, thanks!

         Arnd
