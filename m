Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52973 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751833AbeEYMdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 08:33:38 -0400
Received: by mail-wm0-f66.google.com with SMTP id 18-v6so8398340wml.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 May 2018 05:33:37 -0700 (PDT)
Date: Fri, 25 May 2018 05:06:16 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.18
Message-ID: <20180525120616.nrudvqdi663ebgul@localhost>
References: <cover.1526548323.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1526548323.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 18, 2018 at 01:14:48PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v4.18.
> 
> 
> The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:
> 
>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.18
> 
> for you to fetch changes up to c1fcd2ec1b1970e0e7b0c40c64bc51cf667b1a75:
> 
>   arm64: defconfig: enable R8A77990 SoC (2018-05-16 11:08:20 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.18
> 
> * Enable in ARM64 defconfig:
>   - Recently mainlined support for R-Car E3 (r8a77990) SoC
> 
>   - HDMI sound and depdencies.
> 
>     HDMI sound is used by R-Car Gen 3.  These options are enabled as
>     modules to avoid unnecesesarily enlarging the kernel image.

Thanks, merged.


-Olof
