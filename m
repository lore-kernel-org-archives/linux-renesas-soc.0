Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt1-f176.google.com ([209.85.160.176]:39125 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728765AbeI1WI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 18:08:58 -0400
Received: by mail-qt1-f176.google.com with SMTP id c25-v6so7114371qtp.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Sep 2018 08:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538123642.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538123642.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Sep 2018 17:44:22 +0200
Message-ID: <CAK8P3a3W+L-6fBvw2-a2SvSSaq2wTnaNtdq2hZcXG53XgCCdgQ@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for v4.20
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

On Fri, Sep 28, 2018 at 12:22 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these second round of Renesas ARM based SoC DT updates for
> v4.20.
>
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm-dt-for-v4.20,
> which you have already pulled.
>
>
> The following changes since commit 1926bd6bf20fe306797fbf366902674d2d6c20cc:
>
>   ARM: dts: r9a06g032: Use r9a06g032-sysctrl binding definitions (2018-09-06 11:31:35 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt2-for-v4.20
>
> for you to fetch changes up to e0a39511dafd7e302a974f5cbdfc9c8afffa98d8:
>
>   ARM: dts: iwg20d-q7-common: Move pciec node out of common dtsi (2018-09-28 10:32:50 +0200)
>
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Updates for v4.20
>
> * RZ/G1M (r8a7743) based iWave G20D-Q7 board and camera daughter board
>   - Move PCIe node out of common dtsi to allow reuse of the common dtsi
>     on the iWave RZ/G1N board
> * RZ/G1C (r8a77470) SoC: Add I2C4, SDHI2 and SMP support
> * R-Car Gen1 based boards and R-Car Gen2 SoCs:
>   - Enhance top-of-file comments to include SoC name
> * RZ/N1D (r9a06g032) SoC:
>   - Correct UART0 description and add all other UARTs

Pulled into next/dt, thanks!

       Arnd
