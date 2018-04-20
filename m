Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:46182 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754591AbeDTLZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 07:25:50 -0400
Received: by mail-lf0-f68.google.com with SMTP id j68-v6so4621861lfg.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 04:25:49 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: renesas: eagle: add EtherAVB pins
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <382aeecb-c484-ec27-1ef1-8da1673c2c14@cogentembedded.com>
Message-ID: <8495a934-62f1-3b2e-3125-78844aef04e1@cogentembedded.com>
Date: Fri, 20 Apr 2018 14:25:46 +0300
MIME-Version: 1.0
In-Reply-To: <382aeecb-c484-ec27-1ef1-8da1673c2c14@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 03/14/2018 10:58 PM, Sergei Shtylyov wrote:

> Add the (previously omitted) EtherAVB pin data to the Eagle board's
> device tree.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> pin groups (posted yesterday) in order to work properly...

   The dependency has been now met, please merge this patch.

MBR, Sergei
