Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34963 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbeGUXTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jul 2018 19:19:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id f18-v6so4011412lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jul 2018 15:25:26 -0700 (PDT)
Date: Sat, 21 Jul 2018 15:03:43 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.19
Message-ID: <20180721220343.yuwrfxz3fo25krzv@localhost>
References: <cover.1532086504.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1532086504.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 20, 2018 at 02:03:54PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC defconfig updates for v4.19.
> 
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v4.19
> 
> for you to fetch changes up to e82c98d0448c60706a8024d460eadb9d7402dcba:
> 
>   ARM: multi_v7_defconfig: Enable support for RZN1D-DB (2018-07-13 10:15:20 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.19
> 
> multi_v7_defconfig and shmobile_defconfig Enhancement:
> 
> * Enable support for recently upstreamed RZN1D-DB board
>   in multi_v7_defconfig and shmobile_defconfig. This is
>   to give better test coverage.
> 
> shmobile_defconfig Clean-Up:
> 
> * Drop NET_VENDOR_<FOO>=n
> 
>   This reduces the size of the defconfig without any change in the
>   resulting kernel config.
> 
> shmobile_defconfig Enhancements:
> 
> * Set CONFIG_LOCALVERSION to shmobile_defconfig
> 
>   This follows what appears to be common practice in defconfigs
>   and allows easier management of the kernel flavour at run-time.

I replied to the multi-versions of defconfig for this patch -- it's not a good
way to solve the problem of detecting config at runtime. Please drop this
patch. See:

https://lore.kernel.org/lkml/CAOesGMgkU6yBRpAsED2fPyuAo9Tc=YprndGdkmBVrc+0783VwQ@mail.gmail.com/


-Olof
