Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33359 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbeHFRGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 13:06:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id u14-v6so9329787lfu.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 07:56:47 -0700 (PDT)
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0f33b6af-24b7-84f4-3b7d-f3da337ba965@cogentembedded.com>
Date: Mon, 6 Aug 2018 17:56:44 +0300
MIME-Version: 1.0
In-Reply-To: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/06/2018 01:42 PM, Wolfram Sang wrote:

> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> According to documentation, setting of PHY registers is unnecessary with
> R-Car Gen3. The registers are not even described. So, don't initialize
> them.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [wsa: updated commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
