Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33412 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786AbcFNQxd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:33 -0400
Received: by mail-pf0-f193.google.com with SMTP id c74so13243130pfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:33 -0700 (PDT)
Date: Mon, 13 Jun 2016 15:38:21 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.8
Message-ID: <20160613223821.GC29879@localhost>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 08, 2016 at 09:59:59AM +0900, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT updates for v4.8.
> 
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-for-v4.8
> 
> for you to fetch changes up to b6960f19676e19f37a5e5a8af059fdf3b435d2f4:
> 
>   ARM: dts: silk: Fix W=1 dtc warnings (2016-05-30 09:37:13 +0900)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Updates for v4.8
> 
> * Fix W=1 dtc warnings
> * Reverence both DMA controllers on R-Car Gen 2 SoCs
> * Remove nonexistent thermal sensor clock from r8a7794 SoC
> * Correct unit names for cpu nodes on r8a7790 SoC
> * Add MMCIF0 to r8a7793 SoC
> * RTS/CTS hardware flow control for kzm9g and bockw boards
> 

Merged, thanks.


-Olof
