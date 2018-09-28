Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44881 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbeI2Cns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 22:43:48 -0400
Received: by mail-qk1-f196.google.com with SMTP id g184-v6so4631011qkc.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Sep 2018 13:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538128711.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538128711.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Sep 2018 22:18:09 +0200
Message-ID: <CAK8P3a2ZUdGLG-vVT0MqbZmory6GEVEefZY=6NYMQ=3-kHkZNQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.20
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

On Fri, Sep 28, 2018 at 12:23 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC drivers updates for v4.20.
>
>
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
>
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.20
>
> for you to fetch changes up to fae210bb5bfbd29118e18881f7108c6bd59293b9:
>
>   dt-bindings: apmu: Document r8a7744 support (2018-09-24 17:21:12 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Drivers Updates for v4.20
>
> * Convert to SPDX identifiers
> * R-Car V3M (r8a77970) and V3H (r8a77980): Document Timer Unit (TMU) bindings
> * RZ/G1N (r8a7744) and RZ/G1C (r8a77470) SoCs:
>   - Document APMU and SMP enable method
> * RZ/G2M (r8a74a1), RZ/G1N (r8a7744) and RZ/G2E (r8a774c0) SoCs:
>   - Add reset support
>   - Add sysc support
> * RZ/G2M (r8a774a1), RZ/G2E (r8a774c0) and RZ/A2M (r7s9210) SoCs:
>   - Add support for identifying SoC
> * RZ/A2M (r7s9210) SoC:
>   - Add basic SoC setup support


Pulled into next/drivers, thanks

        Arnd
