Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35089 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751058AbcKRHyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:54:46 -0500
Received: by mail-pg0-f65.google.com with SMTP id p66so19973812pga.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2016 23:54:46 -0800 (PST)
Date: Thu, 17 Nov 2016 17:40:14 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.10
Message-ID: <20161118014014.GG8578@localhost>
References: <cover.1478251192.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1478251192.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 04, 2016 at 10:44:04AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v4.10.
> 
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.10
> 
> for you to fetch changes up to 935085209343a0c507e3d9a3e01883b25c8f743e:
> 
>   arm64: renesas: r8a7796: add SYS-DMAC controller nodes (2016-11-04 10:18:07 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC DT Updates for v4.10
> 
> Enablement:
> * Enable On-board eMMC
> * Enable SDHI 0 & 3 with UHS
> * Add SYS-DMAC controller nodes to r8a7796 SoC
> * Populate EXTALR on r8a7796/salvator-x board; used by watchdog
> * Add DU LVDS output endpoint on r8a7795/salvator-x board
> * Add bias setting for USB1 pins on r8a7795/salvator-x board
> 
> Clean-Up:
> * Remove FCP SoC-specific compatible strings

Thanks, merged.


-Olof
