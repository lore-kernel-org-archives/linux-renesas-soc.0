Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42214 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbeAEGut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 01:50:49 -0500
Received: by mail-lf0-f66.google.com with SMTP id e27so4131609lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jan 2018 22:50:48 -0800 (PST)
Date: Thu, 4 Jan 2018 22:39:38 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.16
Message-ID: <20180105063938.yja5zzluekz4bgjd@localhost>
References: <cover.1513935930.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1513935930.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 22, 2017 at 11:29:33AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC defconfig updates for v4.16.
> 
> 
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
> 
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.16
> 
> for you to fetch changes up to 1943cbd3b39ee3310494d5b531a906e836bb9f7f:
> 
>   ARM: shmobile: defconfig: Enable PWM (2017-12-20 09:29:49 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.16
> 
> shmobile_defconfig:
> * Enable PWM timers, which are present on R-Car and RZ/G1 platforms,
>   as a built-in
> * Enable SGTL5000 audio codec, which is present on the he iWave RZ/G1M Q7
>   carrier board, as a built-in
> 
> multi_v7_defconfig:
> * Enable PWM timers, which are present on R-Car and RZ/G1 platforms,
>   as a module

Merged, thanks.


-Olof
