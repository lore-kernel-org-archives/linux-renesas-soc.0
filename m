Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:56341 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754009AbdJSQKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 12:10:38 -0400
Received: by mail-oi0-f65.google.com with SMTP id v9so15719989oif.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2017 09:10:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1506678593.git.horms+renesas@verge.net.au>
References: <cover.1506678593.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Oct 2017 18:10:37 +0200
Message-ID: <CAK8P3a1U_iK6_zkqWGGAmk_0NjRbVux8cHjmaQfAE3Fw1y41dw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.15
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

On Fri, Sep 29, 2017 at 1:52 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.15
>
> * Enable the following to allow further test coverage
>   - r8a77970 (V3M) and r8a77995 (D3) R-Car Gen3 SoCs
>   - R-Car Gen3 thermal driver.
>     This is used on a range of R-Car Gen3 SoCs

Pulled into next/soc, thanks!
