Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:54692 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754469AbdJSP5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 11:57:25 -0400
Received: by mail-oi0-f65.google.com with SMTP id a132so15654945oih.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2017 08:57:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1506325167.git.horms+renesas@verge.net.au>
References: <cover.1506325167.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Oct 2017 17:57:24 +0200
Message-ID: <CAK8P3a1oEmmXja55SPqhO+z0O3Xh7hRr+tODtLNCjTjsb-z70Q@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.15
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

On Mon, Sep 25, 2017 at 9:53 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
>   ARM: multi_v7_defconfig: Enable BQ32000 RTC driver (2017-09-18 07:57:41 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.15
>
> Enable BQ32000 RTC driver in multi_v7_defconfig.
>
> Biju Das says, "The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> To increase hardware support enable the driver in the
> multi_v7_defconfig multiplatform configuration."

Pulled into next/soc, thanks!
