Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36322 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753532AbdFSGOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:14:42 -0400
Received: by mail-lf0-f65.google.com with SMTP id x81so9011598lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:14:41 -0700 (PDT)
Date: Sun, 18 Jun 2017 22:51:07 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Bindings
 Updates for v4.13
Message-ID: <20170619055107.GK7703@localhost>
References: <cover.1497617896.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497617896.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 03:30:57PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT bindings
> updates for v4.13.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-dt-bindings-for-v4.13,
> which I you have already pulled.
> 
> 
> The following changes since commit 40c9bbea140e64a4257b794969e759c2c481c399:
> 
>   ARM: dts: r7s72100: add USB bit definitions (2017-05-15 09:02:37 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings2-for-v4.13
> 
> for you to fetch changes up to 521ec12e2f56b16e6a0b4e7ef97a666bd3de4ff5:
> 
>   ARM: shmobile: Document Renesas H3-based Salvator-XS board DT bindings (2017-06-12 11:59:07 +0200)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.13
> 
> * Document:
>   - Add Renesas H3-based Salvator-XS board DT bindings
>   - Add iW-RainboW-G20D-Qseven-RZG1M board
>   - Add iW-RainboW-G20M-Qseven-RZG1M system on module
>   - Update R-Car Gen3 ULCB board part numbers
> * Add clock bit definitions for r7s72100 SoC
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       ARM: shmobile: document iW-RainboW-G20M-Qseven-RZG1M system on module
>       ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
> 
> Chris Brandt (1):
>       ARM: dts: r7s72100: add clock bit definitions
> 
> Geert Uytterhoeven (2):
>       ARM: shmobile: Update R-Car Gen3 ULCB board part numbers
>       ARM: shmobile: Document Renesas H3-based Salvator-XS board DT bindings

Merged, thanks.


-Olof
