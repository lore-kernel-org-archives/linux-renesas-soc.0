Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35141 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbcKRHy7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:54:59 -0500
Received: by mail-pg0-f65.google.com with SMTP id p66so19974295pga.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2016 23:54:58 -0800 (PST)
Date: Thu, 17 Nov 2016 17:41:51 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v4.10
Message-ID: <20161118014151.GI8578@localhost>
References: <cover.1478251657.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1478251657.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 04, 2016 at 10:44:42AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC updates for v4.10.
> 
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.10
> 
> for you to fetch changes up to 9652623f8f019edc93a7a934a10b7d0b90421d5a:
> 
>   ARM: shmobile: r8a7779/marzen: Add board part number to DT bindings (2016-11-04 10:25:45 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v4.10
> 
> Enhancements:
> * Basic support for r8a7743 SoC; only SoC code so far
> * Select errata 798181 for SoCs with CA15 cores
> 
> Clean-up:
> * Consolidate R8A7743 and R8A779[234] machine definitions
> 
> Documentation:
> * Add Marzen, Gose and Alt board part numbers to DT bindings
> * Document SK-RZG1M board

Thanks, merged.


-Olof
