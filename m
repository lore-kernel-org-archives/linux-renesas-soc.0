Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39421 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbeI1W2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 18:28:48 -0400
Received: by mail-qt1-f195.google.com with SMTP id c25-v6so7185485qtp.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Sep 2018 09:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538122547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538122547.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Sep 2018 18:04:05 +0200
Message-ID: <CAK8P3a0YQebBWKaixWpk7zFK4T4YYDCY3v8Ce2YmCBudcAU78A@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.20
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

On Fri, Sep 28, 2018 at 12:21 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC defconfig updates for v4.20.
>
>
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
>
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v4.20
>
> for you to fetch changes up to c26eb6f34c9ea56ed795785ecb7938f008dfed1e:
>
>   ARM: shmobile: defconfig: Enable r8a7744 SoC (2018-09-19 10:40:47 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.20
>
> * shmobile and multi_v7 defconfigs:
>   - Enable recently upstreamed r8a7744 SoC
>   - Enable FDP1 (Fine Display processor) present on R-Car Gen2 and RZ/G1 SoCs
> * shmobile defconfig (only):
>   - Refresh for v4.19-rc1
>   - Remove soon to be deprecated SOC_CAMERA

Pulled into next/defconfig, thanks!

      Arnd
