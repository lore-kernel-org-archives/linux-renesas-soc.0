Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33741 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752820AbcKSBuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 20:50:32 -0500
Received: by mail-pf0-f193.google.com with SMTP id 144so14449823pfv.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2016 17:50:32 -0800 (PST)
Date: Fri, 18 Nov 2016 17:43:27 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC EtherAVB Updates for v4.10
Message-ID: <20161119014327.GD2543@localhost>
References: <cover.1479390880.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1479390880.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 03:05:08PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC EtherAVB updates for v4.10.
> 
> This pull request is based on the "Second Round of Renesas ARM64 Based SoC
> DT Updates for v4.10", tagged as arm64-dt-for-v4.10, which I have also sent
> a pull-request for.
> 
> The reason for this base is to provide dependencies. For the same reason
> an ack has been provided by David Miller to facilitate a merge of the patch
> via the Renesas tree.

And now we have cascading dependencies. Can't merge this either.

Why is the DT branch and this driver branch entangled?! Again, there is
absolutely no functional dependency between them.


-Olof
