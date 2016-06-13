Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34947 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbcFNQxa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:30 -0400
Received: by mail-pf0-f193.google.com with SMTP id t190so13218625pfb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:30 -0700 (PDT)
Date: Mon, 13 Jun 2016 15:29:26 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.8
Message-ID: <20160613222926.GB29879@localhost>
References: <cover.1465347183.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1465347183.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 08, 2016 at 09:59:42AM +0900, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v4.8.
> 
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.8
> 
> for you to fetch changes up to 21cc405c8a6332ddad2d2751a9723b2b3e227a05:
> 
>   arm64: dts: r8a7795: Drop 0x from unit address of gic (2016-05-30 10:18:01 +0900)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC DT Updates for v4.8
> 
> * Fix W=1 dtc warnings and other cleanups
> * Enable watchdog timer
> * Enable DMA for I2C
> * Increase the size of GIC-400 mapped registers: be nicer to hypervisors
> * Support RTS/CTS hardware flow control

Merged, thanks.


-Olof
