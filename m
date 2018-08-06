Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:36085 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731932AbeHFThU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 15:37:20 -0400
Date: Mon, 6 Aug 2018 10:27:12 -0700
From: Tejun Heo <tj@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] ata: sata_rcar: really mask all interrupts on Gen2 and
 later
Message-ID: <20180806172712.GE410235@devbig004.ftw2.facebook.com>
References: <20180806104005.29050-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806104005.29050-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 06, 2018 at 12:40:05PM +0200, Wolfram Sang wrote:
> Since R-Car Gen2, a new bit has been introduced to the interrupt mask
> register. Update the code to handle it properly as well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to libata/for-4.19.

Thanks.

-- 
tejun
