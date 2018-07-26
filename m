Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38914 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbeGZIpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 04:45:25 -0400
Received: by mail-lf1-f66.google.com with SMTP id a134-v6so502614lfe.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 00:29:52 -0700 (PDT)
Date: Wed, 25 Jul 2018 23:53:07 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.19
Message-ID: <20180726065307.2e7txeva44uxegfj@localhost>
References: <cover.1532345886.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1532345886.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 02:04:47PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT updates for v4.19.
> 
> Changes since v1:
> * Dropped patch which removes MTD partitioning from DT,
>   Olof requested more discussion of this
> * Trimmed text in tag, as per suggestions from Olof
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v4.19
> 
> for you to fetch changes up to c03e2f12a2967f1639ee53299b72922ee3472528:
> 
>   ARM: dts: r8a77470: Use r8a77470-cpg-mssr binding definitions (2018-07-23 13:33:06 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Updates for v4.19
> 
> * RZ/G1C (r8a77470) SoC: Use r8a77470-cpg-mssr binding definitions
> * Add GR-Peach audio camera shield support with MT9V111 image sensor
> * Add initial support for RZ/N1D (r9a06g032) SoC and its RZN1D-DB board
> * Use SPDX identifiers in DT for all SoCs and boards
> * Add missing OPP properties for all CPUs on various SoCs
> * Add missing PMIC nodes to R-Car Gen2 M2-W (r8a7791) based porter board

Merged, thanks.


-Olof
