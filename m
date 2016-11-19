Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33990 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752820AbcKSBui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 20:50:38 -0500
Received: by mail-pf0-f193.google.com with SMTP id y68so14452059pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2016 17:50:37 -0800 (PST)
Date: Fri, 18 Nov 2016 17:49:29 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.10
Message-ID: <20161119014929.GE2543@localhost>
References: <cover.1479391750.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1479391750.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 03:11:45PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for v4.10.
> 
> This pull request is based on a merge of:
> 
> * The previous round of such requests, tagged as renesas-dt-for-v4.10,
>   which I have already sent a pull-request for.
> * The rzg-clock-defs tag of Geert Uytterhoeven's renesas-driver's tree.
>   This is to provide dependencies for adding the r8a7743 and r8a7745 SoCs.
> * The "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10",
>   tagged as renesas-drivers2-for-v4.10, which I have also sent a pull
>   request for. This is included to provide dependencies for adding device
>   nodes for PRR, and adding the r8a7743 and r8a7745 SoCs..

Again, nack. And again, I don't understand why you create dependencies that
aren't needed. Please fix.


-Olof
