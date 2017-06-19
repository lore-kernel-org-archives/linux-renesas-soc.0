Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36316 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753490AbdFSGOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:14:35 -0400
Received: by mail-lf0-f68.google.com with SMTP id x81so9011557lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:14:30 -0700 (PDT)
Date: Sun, 18 Jun 2017 22:50:08 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.13
Message-ID: <20170619055008.GJ7703@localhost>
References: <cover.1497618353.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497618353.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 03:30:45PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for v4.13.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-dt-for-v4.13,
> which you have already merged.
> 
> 
> The following changes since commit 2ae0fcc57e00c11fae80678e2a9fabbeec82a185:
> 
>   ARM: dts: renesas: Switch to panel-lvds bindings for Mitsubishi panels (2017-05-15 11:14:39 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.13
> 
> for you to fetch changes up to f7d569c1e6a6fa731fc34083a9f0191b7360eeb1:
> 
>   ARM: dts: r8a779x: Fix PCI bus dtc warnings (2017-06-12 11:18:30 +0200)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Updates for v4.13
> 
> Cleanup:
> * Correct PCI bus dtc warnings for r8a779x SoCs
> 
> Enhancements:
> * Add support for iWave G20D-Q7 board based on RZ/G1M SoC
> * Add support for GR-Peach board based on r7s72100 SoC
> * Add composite video and HDMI input to gose board

Merged, thanks!


-Olof
