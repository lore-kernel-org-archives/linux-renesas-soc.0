Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42810 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbeGUXT2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jul 2018 19:19:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id u202-v6so4005555lff.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jul 2018 15:25:08 -0700 (PDT)
Date: Sat, 21 Jul 2018 14:49:00 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.19
Message-ID: <20180721214900.pvr57t2t554vzg6u@localhost>
References: <cover.1532081674.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1532081674.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 20, 2018 at 02:06:04PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT bindings updates for v4.19.
> 
> 
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
> 
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.19
> 
> for you to fetch changes up to a7eaad7f7517ba7cdabfeb28fa05bae4e70b4b5a:
> 
>   dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method. (2018-06-28 14:07:21 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v4.19
> 
> Bindings relating to initial support for RZ/N1D (R9A06G032) SoC and its
> RZN1D-DB board:
> 
> * Add Renesas R9A06G032 SMP enable method
> 
>   To be used to enable second CA7 CPU

This is sort of redundant.

> * Document SoC and Board bindings

Merged, thanks.


-Olof
