Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36629 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751722AbdA3Ffh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 00:35:37 -0500
Received: by mail-pf0-f193.google.com with SMTP id 19so22523618pfo.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Jan 2017 21:34:19 -0800 (PST)
Date: Sun, 29 Jan 2017 20:54:50 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.11
Message-ID: <20170130045450.GA18943@localhost>
References: <cover.1485425227.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1485425227.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 11:11:05AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for v4.11.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-dt-for-v4.11,
> which you have already pulled.
> 
> 
> The following changes since commit 654450baf2afba86cf328e1849ccac61ec4630af:
> 
>   ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes (2017-01-03 10:47:05 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.11
> 
> for you to fetch changes up to 5786ac14239a0809ca13e6a6f77147e6bb04aa29:
> 
>   ARM: dts: r7s72100: add power-domains to mmcif (2017-01-25 11:32:02 +0100)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Updates for v4.11
> 
> Enhancements:
> * Add power-domains to mmcif on r7s72100 SoC
> * Add OSTM to rskrza1/r7s72100
> * Link ARM GIC to clock and clock domain on r8a774[35] SoCs
> 
> Clean-up:
> * Correct SATA device status on r8a7779/marzen

Merged, thanks!


-Olof
