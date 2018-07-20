Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42360 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731704AbeGTQ0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 12:26:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id f1-v6so9847139ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 08:37:13 -0700 (PDT)
Subject: Re: [PATCH 2/2] ata: sata_rcar: Add rudimentary Runtime PM support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Tejun Heo <tj@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180720122739.30056-1-geert+renesas@glider.be>
 <20180720122739.30056-3-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <27c1118f-5d0c-ea2d-2fb8-65a09786408f@cogentembedded.com>
Date: Fri, 20 Jul 2018 18:37:10 +0300
MIME-Version: 1.0
In-Reply-To: <20180720122739.30056-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20/2018 03:27 PM, Geert Uytterhoeven wrote:

> Replace the explicit clock handling to enable/disable the SATA module by
> calls to Runtime PM.
> 
> This makes the driver independent of actual SoC clock/power hierarchies,
> and is needed to support virtualization, where the guest is not in full
> control of power management.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
