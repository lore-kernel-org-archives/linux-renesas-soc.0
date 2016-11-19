Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36685 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752820AbcKSBu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 20:50:27 -0500
Received: by mail-pg0-f67.google.com with SMTP id x23so22098570pgx.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2016 17:50:27 -0800 (PST)
Date: Fri, 18 Nov 2016 17:41:50 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.10
Message-ID: <20161119014150.GC2543@localhost>
References: <cover.1479388193.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1479388193.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 03:04:55PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v4.10.
> 
> This pull request is based on a merge of:
> 
> * The previous round of such requests, tagged as renesas-arm64-dt-for-v4.10,
>   which I have already sent a pull-request for.
> * The "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10",
>   tagged as renesas-drivers2-for-v4.10, which I have also sent a pull
>   request for. This is included to provide dependencies for adding device
>   nodes for PRR.

Please avoid entangling these pull requests, since now I can't merge DT since
I'm rejecting your drivers pull request.

I also don't understand why you need a driver branch as base. The PRR
nodes are literally just a compatible field and a reg entry. It should
depend on nothing.

So, I'm a little confused here. Please disentangle this and send a separate
pull request, I'll be happy to merge that.


-Olof
