Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35360 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934103AbdDSO3J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 10:29:09 -0400
Received: by mail-lf0-f67.google.com with SMTP id i3so2590435lfh.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2017 07:29:08 -0700 (PDT)
Date: Wed, 19 Apr 2017 06:43:28 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.12
Message-ID: <20170419134328.GV29219@localhost>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 07, 2017 at 11:58:21AM -0400, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for
> v4.12.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-dt-for-v4.12,
> which you have already pulled.
> 
> 
> The following changes since commit d01ff18992218f3a13f45f45a886b3bf8f250f14:
> 
>   ARM: dts: silk: Drop superfluous status update for frequency override (2017-03-13 10:19:35 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.12
> 
> for you to fetch changes up to eb77d7260c4c25206e2a455be0dbe6443e0856b5:
> 
>   ARM: dts: r8a7791: Drop _clk suffix from external CAN clock node name (2017-04-05 14:16:34 -0400)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Updates for v4.12
> 
> Corrections:
> * Correct clock frequency of X2 DU clock input for r8a7791/koelsch board
> * Correct Z clock for r8a7792 SoC
> * Correct parent of SSI[0-9] clocks for r8a779[013] SoCs
> * Correct ethernet clock parent on r7s72100 SoC
> * Correct DU clock for r8a7794/silk board
> 
> Cleanups:
> * Drop _clk suffix from external CAN clock node name on r8a779[01] SoCs
> 
> Enhancements:
> * Enable rtc r7s72100/genmai board
> * Add Z2 clock for r8a7794 SoC
> * Add DU clock for r8a7794 SoC
> * Add power-domains to SDHI for r8a7794 and r7s72100 SoCs
> * Add reset control properties for r8a774[35] SoCs

Merged, thanks!


-Olof
