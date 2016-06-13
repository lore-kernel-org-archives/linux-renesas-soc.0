Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33418 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786AbcFNQxg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:36 -0400
Received: by mail-pf0-f193.google.com with SMTP id c74so13243216pfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:36 -0700 (PDT)
Date: Mon, 13 Jun 2016 15:41:25 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC R-Car SYSC Updates for v4.8
Message-ID: <20160613224125.GD29879@localhost>
References: <cover.1465347345.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1465347345.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 08, 2016 at 10:00:12AM +0900, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC R-Car SYSC updates for v4.8.
> 
> There are follow-up DT changes that depend on this driver which I hope
> will be ready to send to you in the v4.8 development cycle.
> 
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-rcar-sysc-for-v4.8
> 
> for you to fetch changes up to e0c98b9171eecf1745eda08de86081db8ec41d51:
> 
>   soc: renesas: rcar-sysc: Add support for R-Car M3-W power areas (2016-06-06 10:14:21 +0900)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC R-Car SYSC Updates for v4.8
> 
> e0c98b9171ee soc: renesas: rcar-sysc: Add support for R-Car M3-W power areas
> 74699228b99d soc: renesas: Add r8a7796 SYSC PM Domain Binding Definitions
> 2ff1bf77e4d4 soc: renesas: rcar-sysc: Document r8a7796 support

That tag description leaves room for improvemnet. I can find out exactly
that information by running git log. Instead, please describe what the
contetns is useful for.

Merged this time, please consider for future branches.


THanks,

-Olof
