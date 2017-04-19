Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34965 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763656AbdDSO16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 10:27:58 -0400
Received: by mail-lf0-f66.google.com with SMTP id i3so2586821lfh.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2017 07:27:57 -0700 (PDT)
Date: Wed, 19 Apr 2017 06:20:41 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.12
Message-ID: <20170419132041.GF29219@localhost>
References: <cover.1491578743.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1491578743.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 07, 2017 at 11:57:59AM -0400, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v4.12.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm64-dt-for-v4.12,
> which you have already pulled.
> 
> 
> The following changes since commit 3cbe33367d4fd480a92fbc131a96fa925be9e95d:
> 
>   arm64: dts: r8a7796: salvator-x: Drop superfluous status update for frequency override (2017-03-13 10:21:16 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.12
> 
> for you to fetch changes up to 6922bd71adab0a7fe8ffbdc3e72a46431fa29656:
> 
>   arm64: dts: r8a7795: salvator-x: Drop _clk suffix from X12 clock node name (2017-04-05 14:17:19 -0400)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.12
> 
> Corrections:
> * r8a7795: Correct SATA device size to 2MiB for r8a7795 SoC
> 
> Cleanup:
> * Drop _clk suffix from X12 clock node name for r8a7795 SoC
> 
> Enhancements:
> * Add reset control properties for r8a779[56]
> 

Merged, thanks.


-Olof
