Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33749 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbeGUXTo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jul 2018 19:19:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id s12-v6so13906911ljj.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jul 2018 15:25:24 -0700 (PDT)
Date: Sat, 21 Jul 2018 14:58:56 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.19
Message-ID: <20180721215856.zxtldktfc7ruhx4w@localhost>
References: <cover.1532080241.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1532080241.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 20, 2018 at 02:03:18PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v4.19.
> 
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.19
> 
> for you to fetch changes up to 83c05e98f732bfa77830631e8d4403c76cad9b31:
> 
>   arm64: defconfig: Enable BD9571MWV regulator (2018-06-18 12:01:14 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.19
> 
> * Enable BD9571MWV regulator in ARM64 defconfig
> 
>   This is to allow wider testing of the BD9571 PMIC which is
>   present on boards with Renesas R-Car Gen3 SoCs

Merged, thanks.


-Olof
