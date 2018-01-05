Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44596 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbeAEGuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 01:50:46 -0500
Received: by mail-lf0-f68.google.com with SMTP id g63so4131921lfl.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jan 2018 22:50:45 -0800 (PST)
Date: Thu, 4 Jan 2018 22:39:04 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.16
Message-ID: <20180105063904.ub6gulilm3c6xzr7@localhost>
References: <cover.1513936760.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1513936760.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 22, 2017 at 11:29:20AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v4.16.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm64-dt-for-v4.16,
> which you have already pulled.
> 
> 
> The following changes since commit 8aba250d7800702bbd2f6a91174e01b9a84ed2dd:
> 
>   arm64: dts: renesas: r8a77970: use SYSC power domain macros (2017-12-05 09:30:48 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.16
> 
> for you to fetch changes up to 68b2c029e6200933fa3f6c06c8e6de33e8c78c51:
> 
>   arm64: dts: renesas: salvator-common: enable usb3_peri0 (2017-12-21 10:22:12 +0100)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.16
> 
> * Add usb3_phy node to r8a7795 (R-Car H3) and r8a7796 (R-Car M3-W) SoCs, and
>   enable usb3_peri0 on salvator boards
> 
> * Allow DTBs of boards of r8a7795 (R-Car H3) and r8a7796 SoCs to build
>   without any warnings when compiled with W=1 using gcc-linaro-5.4.1-2017.05
>   - Move nodes which have no reg property out of bus, they don't belong there
>   - Add reg properties to dummy pciec[01] nodes
>   - Also sort sub-nodes of root node to allow for easier maintenance
> 
> * Add Add EthernetAVB PHY reset to r8a7795 (R-Car H3) and r8a7796 SoCs boards.
> 
>   Geert Uytterhoeven says "... add properties to describe the EthernetAVB
>   PHY reset topology to the common Salvator-X/XS and ULCB DTS files, which
>   solves two issues:
>     1. On Salvator-XS, the enable pin of the regulator providing PHY power
>        is connected to PRESETn, and PSCI powers down the SoC during system
>        suspend.  Hence a PHY reset is needed to restore network
>        functionality after system resume.
>     2. Linux should not rely on the boot loader having reset the PHY, but
>        should reset the PHY during driver probe."
> 

Merged, thanks.


-Olof
