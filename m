Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44436 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754549AbeDTL2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 07:28:55 -0400
Received: by mail-lf0-f65.google.com with SMTP id g203-v6so4645490lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 04:28:54 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: add EtherAVB pins
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
Message-ID: <ed7ddd72-4e52-0b2b-d2ef-1d407f638745@cogentembedded.com>
Date: Fri, 20 Apr 2018 14:28:51 +0300
MIME-Version: 1.0
In-Reply-To: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/14/2018 11:30 PM, Sergei Shtylyov wrote:

> Add the (previously omitted) EtherAVB pin data to the V3M Starter Kit
> board's device tree.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> pin groups (posted yesterday) in order to work properly...

   The dependency has been now met, please merge this patch.

MBR, Sergei
