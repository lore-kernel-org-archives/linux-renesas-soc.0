Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw1-f65.google.com ([209.85.161.65]:38023 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbeHFTgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 15:36:41 -0400
Date: Mon, 6 Aug 2018 10:26:33 -0700
From: Tejun Heo <tj@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
Message-ID: <20180806172633.GD410235@devbig004.ftw2.facebook.com>
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 06, 2018 at 12:42:00PM +0200, Wolfram Sang wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> According to documentation, setting of PHY registers is unnecessary with
> R-Car Gen3. The registers are not even described. So, don't initialize
> them.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [wsa: updated commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to libata/for-4.19.

Thanks.

-- 
tejun
