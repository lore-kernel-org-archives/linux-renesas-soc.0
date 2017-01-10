Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36801 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941256AbdAJDd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 22:33:26 -0500
Received: by mail-lf0-f68.google.com with SMTP id j75so13455298lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2017 19:33:25 -0800 (PST)
Date: Mon, 9 Jan 2017 19:15:32 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.11
Message-ID: <20170110031532.GF22261@localhost>
References: <cover.1483700694.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1483700694.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 06, 2017 at 12:17:56PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v4.11.
> 
> This is based on v4.10-rc2 as v4.10-rc1 does not compile using
> the defconfig.
> 
> 
> The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:
> 
>   Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.11
> 
> for you to fetch changes up to b2b9443beee5017ebdb3f2be9ef472c73d260481:
> 
>   arm64: dts: r8a7795: Add PWM support (2017-01-04 10:00:44 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC DT Updates for v4.11
> 
> * Add PWM, and sound MIX and CTU support to r8a7795 SoC
> * Add CAN, CAN FD and all MSIOF nodes to r8a7796 SoC
> * Use Gen 3 fallback binding for i2c, msiof, PCIE and USB2 phy
> * Enable Ethernet and 4 GiB memory on r8a7796/salvator-x board
> * Add r8a7796/salvator-x board part number to bindings

Merged, thanks.


> ----------------------------------------------------------------
> Chris Paterson (3):
>       arm64: dts: r8a7796: Add CAN external clock support
>       arm64: dts: r8a7796: Add CAN support
>       arm64: dts: r8a7796: Add CAN FD support
> 
> Geert Uytterhoeven (2):
>       arm64: dts: r8a7796: Add all MSIOF nodes
>       arm64: renesas: r8a7796/salvator-x: Add board part number to DT bindings

Nit: When you look at the shortlog, these with different/random format
stand out. Feel free to fix them before sending next time.


-Olof
