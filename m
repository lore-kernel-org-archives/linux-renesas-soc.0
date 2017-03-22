Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35103 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932606AbdCVAk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 20:40:29 -0400
Received: by mail-pg0-f66.google.com with SMTP id g2so27699850pge.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2017 17:40:28 -0700 (PDT)
Date: Tue, 21 Mar 2017 17:37:50 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.12
Message-ID: <20170322003750.GI5129@localhost>
References: <cover.1490000158.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1490000158.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 20, 2017 at 09:58:23AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC drivers updates for v4.12.
> 
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.12
> 
> for you to fetch changes up to cd59de80dd34dd2d1a3ca97d7a6e712c048b135a:
> 
>   soc: renesas: Identify RZ/G1N (2017-03-13 10:26:08 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Drivers Updates for v4.12
> 
> * Identify RZ/G1N and RZ/G1H
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (2):
>       soc: renesas: Identify RZ/G1H
>       soc: renesas: Identify RZ/G1N

At first I was wondering why you'd applied the same patch twice. Renesas likes
to make names similar *and* hard to remember sometimes. :-)


-Olof
