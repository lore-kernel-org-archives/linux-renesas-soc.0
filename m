Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33846 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbdFSGO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:14:27 -0400
Received: by mail-lf0-f66.google.com with SMTP id o28so9031165lfk.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:14:26 -0700 (PDT)
Date: Sun, 18 Jun 2017 22:44:20 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.13
Message-ID: <20170619054420.GH7703@localhost>
References: <cover.1497617276.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497617276.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Jun 16, 2017 at 03:30:17PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v4.13.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm64-dt-for-v4.13,
> which you have already pulled.
> 
> 
> The following changes since commit 0b03c32db03d63de695c1e0ab1950eb12b135fa7:
> 
>   arm64: dts: r8a7795: salvator-x: Add support for R-Car H3 ES2.0 (2017-05-22 14:54:57 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.13
> 
> for you to fetch changes up to 4d1255ebefb6838eab4f652107433438bea0051f:
> 
>   arm64: dts: r8a7796: Add reset control properties for audio (2017-06-14 11:00:29 +0200)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.13
> 
> * Add reset control properties for audio to r9a779[56] SoCs
> * Add add DMA for IIC_DVFS to r9a779[56] SoCs
> * Add support for Salvator-XS and H3ULCB with R-Car H3 (r8a7795) ES2
> * Add missing index to PWM pinctrl subnode name to Salvator-X board
> * Add 12288000 for sound ADG to Salvator-X and ULCB boards

This doesn't mean anything to me. Even if I happened to know what ADG is,
I'm not sure what ADG+12288000 is!?

Looking at the patch, it adds a 12288000 clock to the audio block to be able to
play 48k audio. Maybe that's what you meant to say here?

Merged anyway this time.


-Olof
