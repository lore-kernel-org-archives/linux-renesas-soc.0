Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35694 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941255AbdAJDdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 22:33:33 -0500
Received: by mail-lf0-f66.google.com with SMTP id v186so7320016lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2017 19:33:27 -0800 (PST)
Date: Mon, 9 Jan 2017 19:16:42 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.11
Message-ID: <20170110031642.GG22261@localhost>
References: <cover.1483700969.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 06, 2017 at 12:18:31PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT updates for v4.11.
> 
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-for-v4.11
> 
> for you to fetch changes up to 654450baf2afba86cf328e1849ccac61ec4630af:
> 
>   ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes (2017-01-03 10:47:05 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Updates for v4.11
> 
> * Add da9063 PMIC device node for system restart to gose board
> * Add device node for PRR to SoCs where it was missing
> * Move RST node before SYSC node where it was incorrectly placed
> * Use Gen 2 fallback bindings for I2C, IIC, MSIOf and USB2 phy
> * Use SoC-specific compat string for MMCIF where it was missing

Merged, thanks.


-Olof
