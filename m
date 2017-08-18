Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33497 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdHRVPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 17:15:02 -0400
Received: by mail-oi0-f67.google.com with SMTP id e124so10431062oig.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2017 14:15:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1502961153.git.horms+renesas@verge.net.au>
References: <cover.1502961153.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Aug 2017 23:15:01 +0200
Message-ID: <CAK8P3a0Er5WQMF5+1G_oDHzd2Qp56sCrbY6kkBD_sBeMiwz_yw@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.14
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

On Fri, Aug 18, 2017 at 10:19 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.14
>
> * Add PFC device node to R-Car D3 (r8a77995)
>
>   This is a step towards enabling devices that use multiplexed pins
>   - including ethernet - on boards that use the r8a7796 SoC.
>
> * Add USB nodes to R-Car M3-W (r8a7796)
>
>   This is a step towards enabling USB devices on boards that
>   use the r8a7796 SoC.
>
> * Use newly added Gen-3 fallback compat string
>
>   This is consistent with ongoing efforts to use per-generation
>   fallback strings where appropriate across devices found
>   on R-Car SoCs. The aim of the effort being to strike a balance
>   between the limited information available about the compatibility
>   of devices found on different SoCs and the desire to ease enabling
>   devices on new SoCs.
>
>   This has no run-time effect due to the presence of a per-SoC
>   compat string.
>
> * Cleanup whitespace and extra LVDS port label
>
>   Minor cleanups, no run-time effect.

Pulled into next/dt64, thanks!

        Arnd
