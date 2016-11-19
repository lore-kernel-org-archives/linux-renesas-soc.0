Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36149 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752463AbcKSBuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 20:50:22 -0500
Received: by mail-pf0-f194.google.com with SMTP id c4so11861494pfb.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2016 17:50:21 -0800 (PST)
Date: Fri, 18 Nov 2016 17:35:51 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Drivers Updates
 for v4.10
Message-ID: <20161119013551.GB2543@localhost>
References: <cover.1479389981.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1479389981.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 03:04:35PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC drivers updates for v4.10.
> 
> This pull request is based on a merge of:
> 
> * The previous round of such requests, tagged as renesas-drivers-for-v4.10,
>   which you have already pulled.
> * The soc-device-match-tag1 tag of Geert Uytterhoeven's renesas-driver's tree.
>   This is included to provide core soc_device_match() infrastructure which
>   is a dependency of identifying SoC and registering with SoC bus.
> 
> 
> The following changes since commit 437c4eeb0bd4c1d68817be997716f52b8c22a9c3:
> 
>   Merge tag 'soc-device-match-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into HEAD (2016-11-15 14:12:57 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers2-for-v4.10
> 
> for you to fetch changes up to 63ee9e2ba47dbdb42156c9b940515cfd49e78c91:
> 
>   soc: renesas: Identify SoC and register with the SoC bus (2016-11-17 14:37:20 +0100)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC Drivers Updates for v4.10
> 
> * Identify SoC and register with the SoC bus
> * Add support for the r8a7745 SoC to rcar-sysc
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (2):
>       ARM: shmobile: Document DT bindings for Product Register
>       soc: renesas: Identify SoC and register with the SoC bus
> 
> Sergei Shtylyov (2):
>       ARM: shmobile: r8a7745: add power domain index macros
>       soc: renesas: rcar-sysc: add R8A7745 support
> 

So, this pull request contains 8 patches, not 4. Seems like your pull
request doesn't show any of the code from Geert's branch, didn't mention
it in the tag and only in the email text above. Furthermore, Geert's
branch modifies driver core code, so it's extra important to make sure
it's clear that it's an unusual pull request.

Given that this modifies driver core, please either merge that code
through Greg first, or get an ack from him. If you merge through him,
make sure it's on a standalone topic branch that we can share.


-Olof
