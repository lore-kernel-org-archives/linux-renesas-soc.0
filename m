Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:40878 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752305AbeC0NNS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 09:13:18 -0400
Received: by mail-it0-f66.google.com with SMTP id y20-v6so15220710itc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Mar 2018 06:13:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1521201256.git.horms+renesas@verge.net.au>
References: <cover.1521201256.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Mar 2018 15:13:17 +0200
Message-ID: <CAK8P3a1x9_st4vN7cuMyWk3GrgHYgs8ca5A7ZArM2vEA8ttCgQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.17
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

On Fri, Mar 16, 2018 at 3:50 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Renesas ARM64 Based SoC Defconfig Updates for v4.17
>
> Enable the following to allow them to be more widely exercised:
> * Newly added R8A77965 and R8A77980 SoCs
> * PWM and USB as used on R-Car Gen3 SoCs
>

Pulled into next/defconfig, thanks!

      Arnd
