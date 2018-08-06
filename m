Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35672 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732003AbeHFQ7z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 12:59:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id p10-v6so10860869ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 07:50:27 -0700 (PDT)
Subject: Re: [PATCH] ata: sata_rcar: really mask all interrupts on Gen2 and
 later
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>
References: <20180806104005.29050-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <68316110-1f62-62d6-daed-71db8c9f1e9d@cogentembedded.com>
Date: Mon, 6 Aug 2018 17:50:24 +0300
MIME-Version: 1.0
In-Reply-To: <20180806104005.29050-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 08/06/2018 01:40 PM, Wolfram Sang wrote:

> Since R-Car Gen2, a new bit has been introduced to the interrupt mask
> register. Update the code to handle it properly as well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 3b8ed10bfb8f..1ad168f76ef3 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
[...]

MBR, Sergei
