Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35819 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752774AbcKSBuR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 20:50:17 -0500
Received: by mail-pf0-f193.google.com with SMTP id i88so14396027pfk.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2016 17:50:16 -0800 (PST)
Date: Fri, 18 Nov 2016 17:28:36 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for
 v4.10
Message-ID: <20161119012836.GA2543@localhost>
References: <cover.1479387356.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1479387356.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 02:34:25PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC updates for v4.10.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-soc-for-v4.10,
> which I have already sent a pull-request for.
> 
> 
> The following changes since commit 9652623f8f019edc93a7a934a10b7d0b90421d5a:
> 
>   ARM: shmobile: r8a7779/marzen: Add board part number to DT bindings (2016-11-04 10:25:45 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc2-for-v4.10
> 
> for you to fetch changes up to 4af239175d00c1866cc6b41f3eabcf93c45dcc40:
> 
>   ARM: shmobile: document SK-RZG1E board (2016-11-15 10:59:35 +0100)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC Updates for v4.10
> 
> * Basic support for r8a7745 SoC
> 
> ----------------------------------------------------------------
> Sergei Shtylyov (2):
>       ARM: shmobile: r8a7745: basic SoC support
>       ARM: shmobile: document SK-RZG1E board

Hi,

Is there a reason you're adding a config option per SoC?

I think you'd be better off not adding these config options, and just adding
support for the SoCs through compatibles (and adding the drivers to defconfigs,
etc).

Anyway, I've merged this branch since this is along the lines of what you
already have, but it could be worth looking at cleaning up and removing
some of these options.


-Olof
