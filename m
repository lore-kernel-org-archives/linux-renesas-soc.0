Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:42733 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbeHFUbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 16:31:21 -0400
Date: Mon, 6 Aug 2018 11:21:01 -0700
From: Tejun Heo <tj@kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ata: sata_rcar: Add r8a77965 support
Message-ID: <20180806182101.GG410235@devbig004.ftw2.facebook.com>
References: <20180725191655.3467-1-wsa+renesas@sang-engineering.com>
 <20180806180506.vs56wyjrqb35jkyl@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806180506.vs56wyjrqb35jkyl@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 06, 2018 at 08:05:06PM +0200, Wolfram Sang wrote:
> On Wed, Jul 25, 2018 at 09:16:55PM +0200, Wolfram Sang wrote:
> > Update the binding docs for Renesas R-Car M3-N. No driver changes are
> > needed.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Tejun, could you pick this also for 4.19?
> 
> Thanks for picking the other patches already!

Sure, applied to libata/for-4.19.

Thanks.

-- 
tejun
